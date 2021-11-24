//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadMedico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, jpeg, ExtCtrls, StdCtrls, DBCtrls, EDBZero, RxLookup,
  ToolEdit, RXDBCtrl, Mask, fcButton, fcImgBtn, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  ShellApi;

type
  TFrmCadMedico = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel15: TRxLabel;
    Image1: TImage;
    Panel3: TLMDBackPanel;
    BtnPrimeiro: TfcImageBtn;
    BtnAnterior: TfcImageBtn;
    BtnProximo: TfcImageBtn;
    BtnUltimo: TfcImageBtn;
    BtnNovo: TfcImageBtn;
    BtnGravar: TfcImageBtn;
    BtnCancelar: TfcImageBtn;
    BtnAlterar: TfcImageBtn;
    BtnDeletar: TfcImageBtn;
    BtnLocalizar: TfcImageBtn;
    btnAgenda: TfcImageBtn;
    BtnSair: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    dbNome: TDBEdit;
    RxLabel5: TRxLabel;
    DbCrm: TDBEdit;
    RxLabel45: TRxLabel;
    dbDataNasc: TDBDateEdit;
    RxLabel9: TRxLabel;
    DbEsp1: TDBEdit;
    RxLabel3: TRxLabel;
    DbEsp2: TDBEdit;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    DbTel1: TDBEdit;
    RxLabel8: TRxLabel;
    DbTel2: TDBEdit;
    RxLabel10: TRxLabel;
    DbFax: TDBEdit;
    RxLabel14: TRxLabel;
    DbCelular: TDBEdit;
    RxLabel11: TRxLabel;
    DbBip: TDBEdit;
    RxLabel12: TRxLabel;
    DbCodBip: TDBEdit;
    RxLabel34: TRxLabel;
    dbRG: TDBEdit;
    RxLabel35: TRxLabel;
    dbCPF: TDBEdit;
    lbendereco: TRxLabel;
    cmbLkEnd: TRxDBLookupCombo;
    btnEnd: TfcImageBtn;
    lbnumero: TRxLabel;
    dbNum: TEvDBZeroEdit;
    lbcompl: TRxLabel;
    dbCompl: TDBEdit;
    lbBairro: TRxLabel;
    cmbLkBairro: TRxDBLookupCombo;
    btnBairro: TfcImageBtn;
    lbcep: TRxLabel;
    dbCep: TDBEdit;
    lbuf: TRxLabel;
    dbUf: TDBComboBox;
    lbcidade: TRxLabel;
    cmbLkCidade: TRxDBLookupCombo;
    btnCidade: TfcImageBtn;
    lbemail: TRxLabel;
    dbEmail: TDBEdit;
    BtnEmail: TfcImageBtn;
    RxLabel13: TRxLabel;
    dbDataCad: TDBDateEdit;
    dbCod: TDBEdit;
    dbEsp3: TDBEdit;
    procedure dbEmailExit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure btnAgendaClick(Sender: TObject);
    procedure btnEndClick(Sender: TObject);
    procedure btnBairroClick(Sender: TObject);
    procedure btnCidadeClick(Sender: TObject);
    procedure BtnEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadMedico: TFrmCadMedico;

implementation

uses UnitDmdados, UnitAgendaMedica, UnitEnd, UnitCadBairro, UnitCadCidade;

{$R *.dfm}

procedure TFrmCadMedico.dbEmailExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

procedure TFrmCadMedico.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadMedico.btnAgendaClick(Sender: TObject);
begin
  FrmAgendaMedica:=TFrmAgendaMedica.create(application);
  FrmAgendaMedica.Showmodal;
end;

procedure TFrmCadMedico.btnEndClick(Sender: TObject);
begin
  FrmCadEnd:=TFrmCadEnd.create(application);
  FrmCadEnd.Showmodal;
end;

procedure TFrmCadMedico.btnBairroClick(Sender: TObject);
begin
  FrmCadBairro:=TFrmCadBairro.create(application);
  FrmCadBairro.Showmodal;
end;

procedure TFrmCadMedico.btnCidadeClick(Sender: TObject);
begin
  FrmCadCidade:=TFrmCadCidade.create(application);
  FrmCadCidade.Showmodal;
end;

procedure TFrmCadMedico.BtnEmailClick(Sender: TObject);
var
 url : string;
begin
url :='mailto:'+dmdados.TbPacienteEmail.Value;
shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

end.
