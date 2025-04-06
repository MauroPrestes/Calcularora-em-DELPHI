unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Styles, Vcl.Themes;

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
    opcVisual: TRadioGroup;
    procedure btSomarClick(Sender: TObject);
    procedure btSubtrairClick(Sender: TObject);
    procedure btMultiplicarClick(Sender: TObject);
    procedure btDividirClick(Sender: TObject);
    procedure opcVisualClick(Sender: TObject);
    procedure txtNum1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
    function calcularResultado(num1, num2: Real; operacao: String): Real;
    function validarCampos(): Boolean;
    procedure habilitarBotoes(habilitado: Boolean);
    procedure registrarLog(acao: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


{ TForm1 }

procedure TForm1.btDividirClick(Sender: TObject);
begin
  if validarCampos then
    begin
      if txtNum2.Text = '0' then
      begin
       ShowMessage('Impossivel dividir por zero!');
       registrarLog('Erro de divis�o por zero');
      end
    else
      begin
        txtresultado.Text := FloatToStr(calcularResultado(StrToFloat(txtNum1.Text),StrToFloat(txtNum2.Text),'dividir'));
         registrarLog('Dividir, num1'+txtNum1.Text+', num2='+txtNum2.Text+', resultado='+txtResultado.Text);

      end;
    end;
end;

procedure TForm1.btMultiplicarClick(Sender: TObject);
begin
  if validarCampos then
  begin
    txtresultado.Text := FloatToStr(calcularResultado(StrToFloat(txtNum1.Text),StrToFloat(txtNum2.Text),'multiplicar'));
     registrarLog('Multiplicar, num1'+txtNum1.Text+', num2='+txtNum2.Text+', resultado='+txtResultado.Text);
  end;

end;

procedure TForm1.btSomarClick(Sender: TObject);
begin
   if validarCampos then
    txtResultado.Text := FloatToStr(calcularResultado(StrToFloat(txtNum1.Text),StrToFloat(txtNum2.Text),'somar'));
    registrarLog('Soma, num1'+txtNum1.Text+', num2='+txtNum2.Text+', resultado='+txtResultado.Text);
end;

procedure TForm1.btSubtrairClick(Sender: TObject);
  begin
     if validarCampos then
      begin
         txtResultado.Text := FloatToStr(calcularResultado(StrToFloat(txtNum1.Text),StrToFloat(txtNum2.Text),'subtrair'));
          registrarLog('Subtrair, num1'+txtNum1.Text+', num2='+txtNum2.Text+', resultado='+txtResultado.Text);
      end;
  end;

function TForm1.calcularResultado(num1, num2: Real; operacao: String): Real;
var
  resultado: Real;
begin
  resultado := 0;

  if operacao = 'somar' then
    resultado:= num1 + num2;

  if operacao = 'subtrair' then
    resultado:= num1 - num2;

  if operacao = 'multiplicar' then
    resultado:= num1 * num2;

  if operacao = 'dividir' then
    resultado:= num1 / num2;

  Result := resultado;
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  registrarLog('Aplica��o Finalizada');
  registrarLog('------------------------------------');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  registrarLog('------------------------------------');
  registrarLog('Aplica��o Iniciada');
end;

procedure TForm1.habilitarBotoes(habilitado: Boolean);
begin
  btSomar.Enabled := habilitado;
  btSubtrair.Enabled := habilitado;
  btMultiplicar.Enabled := habilitado;
  btDividir.Enabled := habilitado;
end;

procedure TForm1.opcVisualClick(Sender: TObject);
begin
 case opcVisual.ItemIndex of
    0:
    begin
    TStyleManager.SetStyle('Windows');
    registrarLog('Visual da aplica��o alterado para Windows');
    end;
    1:
    begin
    TStyleManager.SetStyle('Glow');
    registrarLog('Visual da aplica��o alterado para Glow');
    end;
    2:
    begin
    TStyleManager.SetStyle('Aqua Light Slate');
    registrarLog('Visual da aplica��o alterado para Aqua light Slate');
    end;
 end;

end;

procedure TForm1.registrarLog(acao: String);
var
  arquivo: TextFile;
begin
  try
    AssignFile(arquivo, 'Logs.txt');
    if FileExists('Logs.txt') then
      Append(arquivo)
    else
      Rewrite(arquivo);

    Writeln(arquivo,'['+DateTimeToStr(now())+']-' + acao);
  finally
    CloseFile(arquivo);

  end;
end;

procedure TForm1.txtNum1Change(Sender: TObject);
begin
  if validarCampos then
    habilitarBotoes(True)
  else
    habilitarBotoes(False);
end;

function TForm1.validarCampos: Boolean;
begin
  if (txtNum1.Text = '') or (txtNum2.Text = '') then
    Result := False
  else
    try
      StrToFloat(txtNum1.Text);
      StrToFloat(txtNum2.Text);

    Result := True;
    except
      on E: EConvertError do
        begin
          Result := False;
        end;
    end;

end;

end.
