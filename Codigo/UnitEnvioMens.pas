//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitEnvioMens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, RXCtrls, jpeg, ExtCtrls, ImgList, ComCtrls,
  ToolWin, DCChoice, StdCtrls, Mask, DBCtrls, fcImager, Menus, RxMenus,
  Grids, DBGrids, RXDBCtrl;

type
  TFrmEnvioMens = class(TForm)
    Panel2: TPanel;
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    btnNova: TToolButton;
    btnResp: TToolButton;
    ToolButton2: TToolButton;
    btnImprimir: TToolButton;
    ToolButton7: TToolButton;
    btnExcluir: TToolButton;
    btnReceber: TToolButton;
    ToolButton12: TToolButton;
    btnSair: TToolButton;
    ImageList1: TImageList;
    TreeView1: TTreeView;
    Panel1: TPanel;
    RxLabel4: TRxLabel;
    imgTreeVew: TImageList;
    PopTreview: TRxPopupMenu;
    NovaPasta1: TMenuItem;
    Excluir1: TMenuItem;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel3: TRxLabel;
    dbDe: TDBText;
    dbPara: TDBText;
    dbAssunto: TDBText;
    dbMens: TDBMemo;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEnvioMens: TFrmEnvioMens;

implementation

{$R *.dfm}

procedure TFrmEnvioMens.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
