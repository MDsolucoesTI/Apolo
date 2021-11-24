//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitHistPaciente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EDBFind, EDBTime, DBCtrls, ExtCtrls, RackCtls,
  SpeedBar, jpeg, ToolEdit, RXDBCtrl, Mask, RXCtrls, Grids, DBGrids,db,
  fcButton, fcImgBtn, RxGrdCpt, fcImage, fcimageform;

type
  TFrmHistPaciente = class(TForm)
    fcImageForm1: TfcImageForm;
    btnSair: TfcImageBtn;
    dbComp: TDBText;
    RxLabel3: TRxLabel;
    dbMarc: TDBText;
    RxLabel1: TRxLabel;
    RxDBGrid1: TRxDBGrid;
    cmbPaciente: TEvDBFind;
    RxLabel2: TRxLabel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistPaciente: TFrmHistPaciente;

implementation

uses UnitPrincipal, UnitDmdados, UnitAgenda, BaseGrid;

{$R *.dfm}

procedure TFrmHistPaciente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  dmdados.TbAgenda.Filtered:=false;
  Action:=caFree;
end;

procedure TFrmHistPaciente.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmHistPaciente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TFrmHistPaciente.FormShow(Sender: TObject);
var
  linha:integer;
begin
  FrmPrincipal.StatusTeclas(True,'[Esc] Sair');
  linha:=FrmAgenda.StringAgenda.Row;
  dmdados.TbPaciente.Locate('Nome',FrmAgenda.StringAgenda.Cells[1,linha],[loPartialKey]);
  dmdados.tbHistVisu.Filtered:=false;
  dmdados.tbHistVisu.Filter:='(Paciente='''+FrmAgenda.StringAgenda.Cells[1,linha]+''')';
  dmdados.tbHistVisu.Filtered:=true;
end;

end.
