//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UniSalaEsp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RXCtrls, fcImage, fcimageform, Grids, DBGrids,
  RXDBCtrl, fcButton, fcImgBtn, Menus, RxMenus, jpeg, StdCtrls, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmSalaEsp = class(TForm)
    RxPopupMenu2: TRxPopupMenu;
    MenuItem1: TMenuItem;
    LMDBackPanel2: TLMDBackPanel;
    fcImager4: TfcImager;
    RxLabel4: TRxLabel;
    Image1: TImage;
    LMDBackPanel3: TLMDBackPanel;
    fcImager2: TfcImager;
    btnFicha: TfcImageBtn;
    btnAviso: TfcImageBtn;
    fcImageBtn1: TfcImageBtn;
    btnSair: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    gridEstat: TRxDBGrid;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSalaEsp: TFrmSalaEsp;

implementation

{$R *.dfm}

procedure TFrmSalaEsp.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
