unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnClose: TButton;
    btnHitung: TButton;
    btnClear: TButton;
    cbJabatan: TComboBox;
    edtTunjangan: TEdit;
    edtNama: TEdit;
    edtGapok: TEdit;
    edtTotalGaji: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    rgStatus: TRadioGroup;
    procedure btnClearClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnHitungClick(Sender: TObject);
    procedure cbJabatanChange(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnHitungClick(Sender: TObject);
var
  Gapok, Tunjangan, TotalGaji: Double;
begin

  // Validasi Form
  if (cbJabatan.ItemIndex = -1) or (rgStatus.ItemIndex = -1) then
  begin
    ShowMessage('Harap pilih jabatan dan status terlebih dahulu.');
    Exit; // Keluar dari prosedur jika validasi gagal
  end;


  // Mendapatkan gaji pokok berdasarkan jabatan
  case cbJabatan.ItemIndex of
    0: Gapok := 5000000; // Direktur
    1: Gapok := 3000000; // Manager
    2: Gapok := 1000000; // Karyawan
  end;

  // Mendapatkan tunjangan berdasarkan status
  if rgStatus.ItemIndex = 0 then
    Tunjangan := 1500000 // Tetap
  else
    Tunjangan := 500000; // Honorer

  // Menghitung total gaji
  TotalGaji := Gapok + Tunjangan;

  // Menampilkan total gaji di Edit Box Total Gaji
  edtTotalGaji.Text := FloatToStr(TotalGaji);
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  // Membersihkan semua Edit Box
  edtNama.Clear;
  edtGapok.Clear;
  edtTunjangan.Clear;
  edtTotalGaji.Clear;
  cbJabatan.ItemIndex := -1;
  rgStatus.ItemIndex := -1;
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  // Menutup aplikasi
  Close;
end;

procedure TForm1.cbJabatanChange(Sender: TObject);
var
  Gapok: Double;
begin
  // Mengisi edtGapok sesuai dengan jabatan yang dipilih
  case cbJabatan.ItemIndex of
    0: Gapok := 5000000;
    1: Gapok := 3000000;
    2: Gapok := 1000000;
  end;

  edtGapok.Text := FloatToStr(Gapok);
end;

procedure TForm1.rgStatusClick(Sender: TObject);
var
  Tunjangan: Double;
begin
  // Mengisi edtTunjangan sesuai dengan status yang dipilih
  if rgStatus.ItemIndex = 0 then
    Tunjangan := 1500000 // Tetap
  else
    Tunjangan := 500000; // Honorer

  edtTunjangan.Text := FloatToStr(Tunjangan);
end;

end.

