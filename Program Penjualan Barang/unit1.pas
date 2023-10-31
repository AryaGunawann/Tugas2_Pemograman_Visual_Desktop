unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type
  { TForm1 }

  TForm1 = class(TForm)
    CBKode: TComboBox;
    EHarga: TEdit;
    ETotal: TEdit;
    ESubTotal: TEdit;
    EQTY: TEdit;
    ENama: TEdit;
    EDiskon: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure CBKodeChange(Sender: TObject);
    procedure EQTYChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CBKodeChange(Sender: TObject);
var
  Harga: Double;
begin
  case CBKode.ItemIndex of
    0:
    begin
      ENama.Text := 'Celana Dalam';
      EHarga.Text := '400000';
    end;
    1:
    begin
      ENama.Text := 'Kaos Kutang';
      EHarga.Text := '600000';
    end;
    2:
    begin
      ENama.Text := 'Gayung Love';
      EHarga.Text := '800000';
    end;
    3:
    begin
      ENama.Text := 'Ember Emas';
      EHarga.Text := '1000000';
    end;
  end;
end;

procedure TForm1.EQTYChange(Sender: TObject);
var
  Qty, Harga, SubTotal, Diskon, Total: Double;
begin
  if EQTY.Text = '' then
  begin
    ESubTotal.Clear;
    EDiskon.Clear;
    ETotal.Clear;
    Exit;
  end;

  try
    Qty := StrToFloat(EQTY.Text);
    if (Qty <= 0) or (Qty > 10) then
      raise Exception.Create('Quantity harus di antara 1 dan 10');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      EQTY.Clear;
      ESubTotal.Clear;
      EDiskon.Clear;
      ETotal.Clear;
      Exit;
    end;
  end;

  Harga := StrToFloat(EHarga.Text);
  SubTotal := Qty * Harga;
  ESubTotal.Text := FloatToStr(SubTotal);

  // Perhitungan diskon
  if SubTotal >= 20000 then
    Diskon := 0.2
  else if SubTotal >= 10000 then
    Diskon := 0.1
  else
    Diskon := 0;

  EDiskon.Text := FloatToStr(Diskon * 100) + '%';

  // Perhitungan total dengan diskon
  Total := SubTotal * (1 - Diskon);
  ETotal.Text := FloatToStr(Total);
end;

end.

