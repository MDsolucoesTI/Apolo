//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadTel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGrdCpt, fcButton, fcImgBtn, StdCtrls, Mask, DBCtrls, RXCtrls,
  jpeg, ExtCtrls, fcImage, fcimageform, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadTel = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel8: TRxLabel;
    Image2: TImage;
    LMDBackPanel3: TLMDBackPanel;
    btnGravar: TfcImageBtn;
    BtnDeletar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel2: TRxLabel;
    dbNome: TDBEdit;
    RxLabel1: TRxLabel;
    dbEnd: TDBEdit;
    RxLabel3: TRxLabel;
    dbEmail: TDBEdit;
    RxLabel5: TRxLabel;
    dbTel: TDBEdit;
    RxLabel6: TRxLabel;
    dbCel: TDBEdit;
    RxLabel7: TRxLabel;
    dbFax: TDBEdit;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadTel: TFrmCadTel;

implementation

{$R *.dfm}

procedure TFrmCadTel.btnCancelarClick(Sender: TObject);
begin
  close;
end;

end.
