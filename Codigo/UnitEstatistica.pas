//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitEstatistica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RXCtrls, fcImage, fcimageform, StdCtrls, Mask,
  ToolEdit, RXDBCtrl, DBCtrls, Grids, DBGrids, fcButton, fcImgBtn, EGauge,
  jpeg, CurrEdit, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmEstatistica = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel4: TRxLabel;
    Image2: TImage;
    LMDBackPanel3: TLMDBackPanel;
    btnIniciar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel12: TRxLabel;
    CmbTipo: TDBComboBox;
    gridEstat: TRxDBGrid;
    RxLabel5: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    Bevel1: TBevel;
    EvGauge1: TEvGauge;
    dbDataFin: TDBDateEdit;
    RxLabel3: TRxLabel;
    RxLabel7: TRxLabel;
    dbDataIn: TDBDateEdit;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEstatistica: TFrmEstatistica;

implementation

{$R *.dfm}

procedure TFrmEstatistica.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
