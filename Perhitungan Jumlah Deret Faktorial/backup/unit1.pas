unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    function HitungFaktorial(N: Integer): Int64;
    function HitungJumlahDeret(N: Integer): Int64;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1Change(Sender: TObject);
begin
  // Kosongkan Edit2 dan Edit3 saat Edit1 berubah
  Edit2.Text := '';
  Edit3.Text := '';
end;

function TForm1.HitungFaktorial(N: Integer): Int64;
begin
  if N = 0 then
    Result := 1
  else
    Result := N * HitungFaktorial(N - 1);
end;

function TForm1.HitungJumlahDeret(N: Integer): Int64;
begin
  Result := (N * (N + 1)) div 2;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  N: Integer;
  Faktorial, JumlahDeret: Int64;
begin
  // Cek apakah input Edit1 adalah angka yang valid
  if TryStrToInt(Edit1.Text, N) then
  begin
    // Memastikan N tidak negatif
    if N < 0 then
    begin
      ShowMessage('Masukkan bilangan bulat tidak negatif.');
      Exit;
    end;

    // Menghitung faktorial
    Faktorial := HitungFaktorial(N);
    Edit2.Text := IntToStr(Faktorial);

    // Menghitung jumlah deret
    JumlahDeret := HitungJumlahDeret(N);
    Edit3.Text := IntToStr(JumlahDeret);
  end
  else
  begin
    ShowMessage('Masukkan angka yang valid pada Edit1.');
  end;
end;

end.

