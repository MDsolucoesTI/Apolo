//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitResumoAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, RXCtrls, jpeg, ExtCtrls, StdCtrls, DBCtrls,
  Mask, ToolEdit, RXDBCtrl, CurrEdit, EnhEdit, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmResumoAgenda = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    RxLabel40: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    EnhancedEdit1: TEnhancedEdit;
    EnhancedEdit2: TEnhancedEdit;
    Panel5: TPanel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    EnhancedEdit3: TEnhancedEdit;
    EnhancedEdit4: TEnhancedEdit;
    Panel6: TPanel;
    RxLabel10: TRxLabel;
    Panel7: TPanel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel13: TRxLabel;
    EnhancedEdit5: TEnhancedEdit;
    EnhancedEdit6: TEnhancedEdit;
    Panel8: TPanel;
    RxLabel14: TRxLabel;
    Panel9: TPanel;
    RxLabel15: TRxLabel;
    RxLabel16: TRxLabel;
    RxLabel17: TRxLabel;
    EnhancedEdit7: TEnhancedEdit;
    EnhancedEdit8: TEnhancedEdit;
    Panel10: TPanel;
    RxLabel18: TRxLabel;
    Panel11: TPanel;
    RxLabel19: TRxLabel;
    RxLabel20: TRxLabel;
    RxLabel21: TRxLabel;
    EnhancedEdit9: TEnhancedEdit;
    EnhancedEdit10: TEnhancedEdit;
    Panel12: TPanel;
    RxLabel22: TRxLabel;
    Panel13: TPanel;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    RxLabel25: TRxLabel;
    EnhancedEdit11: TEnhancedEdit;
    EnhancedEdit12: TEnhancedEdit;
    Panel14: TPanel;
    RxLabel26: TRxLabel;
    Bevel1: TBevel;
    RxLabel27: TRxLabel;
    EnhancedEdit13: TEnhancedEdit;
    RxLabel28: TRxLabel;
    EnhancedEdit14: TEnhancedEdit;
    Panel17: TPanel;
    RxLabel32: TRxLabel;
    RxLabel33: TRxLabel;
    RxLabel34: TRxLabel;
    EnhancedEdit15: TEnhancedEdit;
    EnhancedEdit16: TEnhancedEdit;
    Panel19: TPanel;
    RxLabel36: TRxLabel;
    RxLabel37: TRxLabel;
    RxLabel38: TRxLabel;
    Bevel2: TBevel;
    RxLabel39: TRxLabel;
    RxLabel41: TRxLabel;
    EnhancedEdit17: TEnhancedEdit;
    EnhancedEdit18: TEnhancedEdit;
    EnhancedEdit19: TEnhancedEdit;
    EnhancedEdit20: TEnhancedEdit;
    Panel21: TPanel;
    RxLabel43: TRxLabel;
    RxLabel44: TRxLabel;
    RxLabel45: TRxLabel;
    EnhancedEdit21: TEnhancedEdit;
    EnhancedEdit22: TEnhancedEdit;
    Panel23: TPanel;
    RxLabel47: TRxLabel;
    RxLabel48: TRxLabel;
    RxLabel49: TRxLabel;
    EnhancedEdit23: TEnhancedEdit;
    EnhancedEdit24: TEnhancedEdit;
    Panel25: TPanel;
    RxLabel51: TRxLabel;
    RxLabel52: TRxLabel;
    RxLabel53: TRxLabel;
    EnhancedEdit25: TEnhancedEdit;
    EnhancedEdit26: TEnhancedEdit;
    Panel27: TPanel;
    RxLabel55: TRxLabel;
    RxLabel56: TRxLabel;
    RxLabel57: TRxLabel;
    EnhancedEdit27: TEnhancedEdit;
    EnhancedEdit28: TEnhancedEdit;
    Panel15: TPanel;
    RxLabel29: TRxLabel;
    RxLabel30: TRxLabel;
    RxLabel31: TRxLabel;
    EnhancedEdit29: TEnhancedEdit;
    EnhancedEdit30: TEnhancedEdit;
    Panel16: TPanel;
    RxLabel35: TRxLabel;
    RxLabel42: TRxLabel;
    RxLabel46: TRxLabel;
    EnhancedEdit31: TEnhancedEdit;
    EnhancedEdit32: TEnhancedEdit;
    Panel18: TPanel;
    RxLabel50: TRxLabel;
    RxLabel54: TRxLabel;
    RxLabel58: TRxLabel;
    EnhancedEdit33: TEnhancedEdit;
    EnhancedEdit34: TEnhancedEdit;
    Panel20: TPanel;
    RxLabel59: TRxLabel;
    RxLabel60: TRxLabel;
    RxLabel61: TRxLabel;
    EnhancedEdit35: TEnhancedEdit;
    EnhancedEdit36: TEnhancedEdit;
    Panel22: TPanel;
    RxLabel62: TRxLabel;
    RxLabel63: TRxLabel;
    RxLabel64: TRxLabel;
    EnhancedEdit37: TEnhancedEdit;
    EnhancedEdit38: TEnhancedEdit;
    Panel24: TPanel;
    RxLabel65: TRxLabel;
    RxLabel66: TRxLabel;
    RxLabel67: TRxLabel;
    Bevel3: TBevel;
    EnhancedEdit39: TEnhancedEdit;
    EnhancedEdit40: TEnhancedEdit;
    EnhancedEdit41: TEnhancedEdit;
    EnhancedEdit42: TEnhancedEdit;
    RxLabel68: TRxLabel;
    RxLabel69: TRxLabel;
    RxLabel70: TRxLabel;
    RxLabel71: TRxLabel;
    RxLabel72: TRxLabel;
    RxLabel73: TRxLabel;
    RxLabel74: TRxLabel;
    RxLabel75: TRxLabel;
    RxLabel76: TRxLabel;
    RxLabel77: TRxLabel;
    RxLabel78: TRxLabel;
    RxLabel79: TRxLabel;
    RxLabel80: TRxLabel;
    RxLabel81: TRxLabel;
    RxLabel82: TRxLabel;
    RxLabel83: TRxLabel;
    RxLabel84: TRxLabel;
    RxLabel85: TRxLabel;
    RxLabel86: TRxLabel;
    RxLabel87: TRxLabel;
    RxLabel88: TRxLabel;
    Panel26: TPanel;
    RxLabel89: TRxLabel;
    RxLabel90: TRxLabel;
    RxLabel91: TRxLabel;
    RxLabel92: TRxLabel;
    EnhancedEdit43: TEnhancedEdit;
    EnhancedEdit44: TEnhancedEdit;
    Panel28: TPanel;
    RxLabel93: TRxLabel;
    RxLabel94: TRxLabel;
    RxLabel95: TRxLabel;
    RxLabel96: TRxLabel;
    EnhancedEdit45: TEnhancedEdit;
    EnhancedEdit46: TEnhancedEdit;
    Panel29: TPanel;
    RxLabel97: TRxLabel;
    RxLabel98: TRxLabel;
    RxLabel99: TRxLabel;
    RxLabel100: TRxLabel;
    EnhancedEdit47: TEnhancedEdit;
    EnhancedEdit48: TEnhancedEdit;
    Panel30: TPanel;
    RxLabel101: TRxLabel;
    RxLabel102: TRxLabel;
    RxLabel103: TRxLabel;
    RxLabel104: TRxLabel;
    EnhancedEdit49: TEnhancedEdit;
    EnhancedEdit50: TEnhancedEdit;
    Panel31: TPanel;
    RxLabel105: TRxLabel;
    RxLabel106: TRxLabel;
    RxLabel107: TRxLabel;
    RxLabel108: TRxLabel;
    EnhancedEdit51: TEnhancedEdit;
    EnhancedEdit52: TEnhancedEdit;
    Panel32: TPanel;
    RxLabel109: TRxLabel;
    RxLabel110: TRxLabel;
    RxLabel111: TRxLabel;
    Bevel4: TBevel;
    RxLabel112: TRxLabel;
    RxLabel113: TRxLabel;
    RxLabel114: TRxLabel;
    EnhancedEdit53: TEnhancedEdit;
    EnhancedEdit54: TEnhancedEdit;
    EnhancedEdit55: TEnhancedEdit;
    EnhancedEdit56: TEnhancedEdit;
    Panel33: TPanel;
    RxLabel115: TRxLabel;
    RxLabel116: TRxLabel;
    RxLabel117: TRxLabel;
    RxLabel118: TRxLabel;
    EnhancedEdit57: TEnhancedEdit;
    EnhancedEdit58: TEnhancedEdit;
    Panel34: TPanel;
    RxLabel119: TRxLabel;
    RxLabel120: TRxLabel;
    RxLabel121: TRxLabel;
    RxLabel122: TRxLabel;
    EnhancedEdit59: TEnhancedEdit;
    EnhancedEdit60: TEnhancedEdit;
    Panel35: TPanel;
    RxLabel123: TRxLabel;
    RxLabel124: TRxLabel;
    RxLabel125: TRxLabel;
    RxLabel126: TRxLabel;
    EnhancedEdit61: TEnhancedEdit;
    EnhancedEdit62: TEnhancedEdit;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    RxLabel141: TRxLabel;
    RxLabel142: TRxLabel;
    RxLabel143: TRxLabel;
    LMDBackPanel2: TLMDBackPanel;
    RxLabel4: TRxLabel;
    RxLabel1: TRxLabel;
    Image2: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmResumoAgenda: TFrmResumoAgenda;

implementation

{$R *.dfm}

end.
