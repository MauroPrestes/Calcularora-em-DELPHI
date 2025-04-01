unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    txtNum1: TEdit;
    Label2: TLabel;
    txtNum2: TEdit;
    btSomar: TButton;
    btSubtrair: TButton;
    btMultiplicar: TButton;
    btDividir: TButton;
    Label3: TLabel;
    txtResultado: TEdit;
    procedure btSomarClick(Sender: TObject);
    procedure btSubtrairClick(Sender: TObject);
    procedure btMultiplicarClick(Sender: TObject);
    procedure btDividirClick(Sender: TObject);
  private
    { Private declarations }
    procedure calcularResultado(operacao: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btDividirClick(Sender: TObject);
begin
  if txtNum2.Text = '0' then
    ShowMessage('Impossivel dividir por zero!')
  else
  calcularResultado('dividir');
end;

procedure TForm1.btMultiplicarClick(Sender: TObject);
begin
 calcularResultado('multiplicar');
end;

procedure TForm1.btSomarClick(Sender: TObject);
begin
 calcularResultado('somar');
end;

procedure TForm1.btSubtrairClick(Sender: TObject);
begin
 calcularResultado('subtrair');
end;

procedure TForm1.calcularResultado(operacao: String);
var
  num1, num2: Real;
  resultado: Real;
begin
  resultado := 0;
  num1 := StrToFloat(txtNum1.Text);
  num2 := StrToFloat(txtNum2.Text);

  if operacao  = 'somar' then
      resultado := num1 + num2;

  if operacao = 'subtrair' then
      resultado := num1 - num2;

  if operacao = 'multiplicar' then
      resultado := num1 * num2;

  if operacao = 'dividir' then
      resultado := num1 / num2;

  txtResultado.Text := FloatToStr(resultado);
end;

end.
