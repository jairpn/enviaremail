object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Envio de e-mails'
  ClientHeight = 276
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 23
    Width = 17
    Height = 13
    Caption = 'De:'
  end
  object Label2: TLabel
    Left = 8
    Top = 71
    Width = 26
    Height = 13
    Caption = 'Para:'
  end
  object Label3: TLabel
    Left = 8
    Top = 127
    Width = 43
    Height = 13
    Caption = 'Assunto:'
  end
  object Label4: TLabel
    Left = 8
    Top = 173
    Width = 60
    Height = 13
    Caption = 'Quantidade:'
  end
  object btnEnviar: TButton
    Left = 326
    Top = 190
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 0
    OnClick = btnEnviarClick
  end
  object edtMax: TEdit
    Left = 8
    Top = 192
    Width = 73
    Height = 21
    TabOrder = 1
    Text = '5'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 234
    Width = 387
    Height = 17
    TabOrder = 2
  end
  object edtDe: TEdit
    Left = 8
    Top = 42
    Width = 387
    Height = 21
    TabOrder = 3
  end
  object edtPara: TEdit
    Left = 8
    Top = 90
    Width = 387
    Height = 21
    TabOrder = 4
  end
  object Edit1: TEdit
    Left = 8
    Top = 146
    Width = 387
    Height = 21
    TabOrder = 5
  end
  object IdSMTP1: TIdSMTP
    Host = 'mail.japasoft.com.br'
    Password = 'J@pa0101'
    SASLMechanisms = <>
    Username = 'contato@japasoft.com.br'
    Left = 128
    Top = 184
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 184
    Top = 184
  end
end
