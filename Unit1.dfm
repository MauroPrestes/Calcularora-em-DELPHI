object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Calculadora'
  ClientHeight = 483
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 40
    Top = 40
    Width = 33
    Height = 15
    Caption = 'Num1'
  end
  object Label2: TLabel
    Left = 40
    Top = 104
    Width = 33
    Height = 15
    Caption = 'Num2'
  end
  object Label3: TLabel
    Left = 40
    Top = 216
    Width = 52
    Height = 15
    Caption = 'Resultado'
  end
  object txtNum1: TEdit
    Left = 40
    Top = 61
    Width = 177
    Height = 23
    TabOrder = 0
  end
  object txtNum2: TEdit
    Left = 40
    Top = 125
    Width = 177
    Height = 23
    TabOrder = 1
  end
  object btSomar: TButton
    Left = 40
    Top = 168
    Width = 25
    Height = 25
    Caption = '+'
    TabOrder = 2
    OnClick = btSomarClick
  end
  object btSubtrair: TButton
    Left = 71
    Top = 168
    Width = 25
    Height = 25
    Caption = '-'
    TabOrder = 3
    OnClick = btSubtrairClick
  end
  object btMultiplicar: TButton
    Left = 105
    Top = 168
    Width = 25
    Height = 25
    Caption = '*'
    TabOrder = 4
    OnClick = btMultiplicarClick
  end
  object btDividir: TButton
    Left = 136
    Top = 168
    Width = 25
    Height = 25
    Caption = '/'
    TabOrder = 5
    OnClick = btDividirClick
  end
  object txtResultado: TEdit
    Left = 40
    Top = 237
    Width = 177
    Height = 23
    TabOrder = 6
  end
  object opcVisual: TRadioGroup
    Left = 40
    Top = 320
    Width = 185
    Height = 121
    Caption = 'Alterar Visual da Calculadora'
    ItemIndex = 1
    Items.Strings = (
      'Windows Classico'
      'Grow'
      'Aqua Ligth')
    TabOrder = 7
    OnClick = opcVisualClick
  end
end
