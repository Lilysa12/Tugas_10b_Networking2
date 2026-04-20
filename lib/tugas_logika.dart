// ==========================================
// SOAL 1: Array 2 Dimensi
// ==========================================
void jalankanSoal1() {
  // Deklarasi array 2 dimensi (List of Lists)
  List<List<int>> array2D = [];

  // Baris 1: 4 bilangan kelipatan 6 berurutan mulai dari 6
  List<int> baris1 = [];
  for (int i = 1; i <= 4; i++) {
    baris1.add(i * 6);
  }
  array2D.add(baris1);

  // Baris 2: 5 bilangan ganjil berurutan mulai dari 3
  List<int> baris2 = [];
  for (int i = 0; i < 5; i++) {
    baris2.add(3 + (i * 2));
  }
  array2D.add(baris2);

  // Baris 3: 6 bilangan pangkat tiga dari bilangan asli mulai dari 4
  List<int> baris3 = [];
  for (int i = 0; i < 6; i++) {
    int angka = 4 + i;
    baris3.add(angka * angka * angka); // Pangkat 3
  }
  array2D.add(baris3);

  // Baris 4: 7 bilangan asli berurutan beda 7 mulai dari 3
  List<int> baris4 = [];
  for (int i = 0; i < 7; i++) {
    baris4.add(3 + (i * 7));
  }
  array2D.add(baris4);

  // Mencetak Output Soal 1
  print('Isi List:');
  for (var baris in array2D) {
    // .join(' ') digunakan untuk menghilangkan kurung siku bawaan List
    print(baris.join(' ')); 
  }
}

// ==========================================
// SOAL 2: Fungsi FPB
// ==========================================
int hitungFPB(int a, int b) {
  // Algoritma Euclidean untuk mencari FPB
  while (b != 0) {
    int sisa = a % b;
    a = b;
    b = sisa;
  }
  return a;
}

void jalankanSoal2() {
  int bilangan1 = 12;
  int bilangan2 = 8;
  int hasilFPB = hitungFPB(bilangan1, bilangan2);

  // Mencetak Output Soal 2
  print('Bilangan 1: $bilangan1');
  print('Bilangan 2: $bilangan2');
  print('FPB $bilangan1 dan $bilangan2 = $hasilFPB');
}

// ==========================================
// FUNGSI MAIN (Titik masuk utama aplikasi Dart)
// ==========================================
void main() {
  print('--- HASIL SOAL 1 ---');
  jalankanSoal1();
  
  print('\n--- HASIL SOAL 2 ---'); // \n untuk enter / baris baru
  jalankanSoal2();
}