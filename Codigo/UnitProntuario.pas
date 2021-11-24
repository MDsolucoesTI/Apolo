//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitProntuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, fcButton, fcImgBtn,
  RXCtrls, LMDFontSizeComboBox, StdCtrls, LMDCustomComboBox,
  LMDFontComboBox, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, EDBTime, Mask,
  ToolEdit, DBCtrls, ETimeEd, RXDBCtrl, jpeg, fcImager, Menus, RxMenus,
  RxDBComb, RxLookup, ExtDlgs, Grids, DBGrids;

type
  TFrmProntuario = class(TForm)
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    btnMedico: TToolButton;
    ToolButton2: TToolButton;
    btnFichPac: TToolButton;
    ToolButton7: TToolButton;
    ToolButton5: TToolButton;
    ToolButton8: TToolButton;
    ToolButton12: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton13: TToolButton;
    ToolButton9: TToolButton;
    ToolButton6: TToolButton;
    Panel1: TPanel;
    imgTreeVew: TImageList;
    Panel2: TPanel;
    RxLabel4: TRxLabel;
    imgBotoes: TImageList;
    TreeView1: TTreeView;
    RxLabel3: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel1: TRxLabel;
    ToolButton1: TToolButton;
    ToolButton14: TToolButton;
    PopTreview: TRxPopupMenu;
    NovaPasta1: TMenuItem;
    PnAna: TPanel;
    AbreFigura: TOpenPictureDialog;
    dbHora: TEvDBTimeEdit;
    dbData: TDBDateEdit;
    dbMedico: TDBText;
    dbOssea: TDBComboBox;
    dbpeso: TDBEdit;
    dbaltura: TDBEdit;
    dbResultado: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    RxLabel2: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel13: TRxLabel;
    RxLabel14: TRxLabel;
    RxLabel15: TRxLabel;
    RxLabel16: TRxLabel;
    PnHist: TPanel;
    PnEditor: TPanel;
    btnNovo: TLMDSpeedButton;
    btnAbrir: TLMDSpeedButton;
    btnSalvar: TLMDSpeedButton;
    LMDSimpleLabel2: TLMDSimpleLabel;
    Bevel1: TBevel;
    LMDSpeedButton10: TLMDSpeedButton;
    LMDSpeedButton11: TLMDSpeedButton;
    LMDSpeedButton12: TLMDSpeedButton;
    Bevel2: TBevel;
    LMDSpeedButton13: TLMDSpeedButton;
    LMDSpeedButton14: TLMDSpeedButton;
    LMDSpeedButton15: TLMDSpeedButton;
    LMDSpeedButton16: TLMDSpeedButton;
    LMDFontComboBox1: TLMDFontComboBox;
    LMDFontSizeComboBox1: TLMDFontSizeComboBox;
    dbTexto: TDBRichEdit;
    RxLabel17: TRxLabel;
    dbAlerta: TDBEdit;
    RxLabel18: TRxLabel;
    dbQueixa: TDBMemo;
    RxLabel19: TRxLabel;
    dbDiag: TDBMemo;
    RxLabel20: TRxLabel;
    dbConduta: TDBMemo;
    RxLabel21: TRxLabel;
    dbExame: TDBMemo;
    RxLabel22: TRxLabel;
    dbHMA: TDBMemo;
    Bevel3: TBevel;
    DBGridCid: TDBGrid;
    BtnDeletar: TfcImageBtn;
    BtnLocalizar: TfcImageBtn;
    procedure btnFichPacClick(Sender: TObject);
    procedure btnMedicoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProntuario: TFrmProntuario;

implementation

uses UnitAcesPront, UnitCadPaciente;

{$R *.dfm}

procedure TFrmProntuario.btnFichPacClick(Sender: TObject);
begin
  FrmCadPaciente:=TFrmCadPaciente.create(application);
  FrmCadPaciente.Showmodal;
end;

procedure TFrmProntuario.btnMedicoClick(Sender: TObject);
begin
  FrmAcesPront:=TFrmAcesPront.create(application);
  FrmAcesPront.Showmodal;
end;

end.
