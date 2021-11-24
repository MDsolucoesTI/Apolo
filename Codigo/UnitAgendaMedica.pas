//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitAgendaMedica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, jpeg, ExtCtrls, fcButton, fcImgBtn, ToolEdit, RXDBCtrl,
  StdCtrls, DBCtrls, Mask, SRChkBox, EDBTime, ComCtrls, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmAgendaMedica = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    Image2: TImage;
    RxLabel4: TRxLabel;
    LMDBackPanel1: TLMDBackPanel;
    Bevel1: TBevel;
    RxLabel5: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel6: TRxLabel;
    SRCheckBox1: TSRCheckBox;
    SRCheckBox2: TSRCheckBox;
    RxLabel8: TRxLabel;
    SRCheckBox3: TSRCheckBox;
    RxLabel9: TRxLabel;
    SRCheckBox4: TSRCheckBox;
    RxLabel10: TRxLabel;
    SRCheckBox5: TSRCheckBox;
    RxLabel11: TRxLabel;
    SRCheckBox6: TSRCheckBox;
    RxLabel12: TRxLabel;
    SRCheckBox7: TSRCheckBox;
    RxLabel13: TRxLabel;
    RxLabel15: TRxLabel;
    RxLabel16: TRxLabel;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    RxLabel19: TRxLabel;
    RxLabel2: TRxLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    dbCodHor: TDBEdit;
    dbMedico: TDBComboBox;
    dbServ: TDBEdit;
    db1: TEvDBTimeEdit;
    db2: TEvDBTimeEdit;
    db3: TEvDBTimeEdit;
    db4: TEvDBTimeEdit;
    db5: TEvDBTimeEdit;
    db6: TEvDBTimeEdit;
    db7: TEvDBTimeEdit;
    db8: TEvDBTimeEdit;
    db9: TEvDBTimeEdit;
    db10: TEvDBTimeEdit;
    db11: TEvDBTimeEdit;
    db12: TEvDBTimeEdit;
    db13: TEvDBTimeEdit;
    db14: TEvDBTimeEdit;
    db15: TEvDBTimeEdit;
    db16: TEvDBTimeEdit;
    db17: TEvDBTimeEdit;
    db18: TEvDBTimeEdit;
    db19: TEvDBTimeEdit;
    db20: TEvDBTimeEdit;
    db21: TEvDBTimeEdit;
    db22: TEvDBTimeEdit;
    db23: TEvDBTimeEdit;
    db24: TEvDBTimeEdit;
    db25: TEvDBTimeEdit;
    db26: TEvDBTimeEdit;
    db27: TEvDBTimeEdit;
    db28: TEvDBTimeEdit;
    db29: TEvDBTimeEdit;
    db30: TEvDBTimeEdit;
    db31: TEvDBTimeEdit;
    db32: TEvDBTimeEdit;
    db33: TEvDBTimeEdit;
    db34: TEvDBTimeEdit;
    db35: TEvDBTimeEdit;
    Calendario: TMonthCalendar;
    LMDBackPanel3: TLMDBackPanel;
    BtnPrimeiro: TfcImageBtn;
    BtnAnterior: TfcImageBtn;
    BtnProximo: TfcImageBtn;
    BtnUltimo: TfcImageBtn;
    BtnNovo: TfcImageBtn;
    BtnGravar: TfcImageBtn;
    BtnCancelar: TfcImageBtn;
    BtnAlterar: TfcImageBtn;
    BtnDeletar: TfcImageBtn;
    BtnSair: TfcImageBtn;
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgendaMedica: TFrmAgendaMedica;

implementation

{$R *.dfm}

procedure TFrmAgendaMedica.BtnSairClick(Sender: TObject);
begin
  Close;
end;

end.
