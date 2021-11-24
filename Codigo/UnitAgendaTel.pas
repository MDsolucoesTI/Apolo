//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitAgendaTel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcImage, fcimageform, RxGIF, ExtCtrls, StdCtrls, Mask, DBCtrls,
  RXCtrls, EDBZero, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, Grids, BaseGrid, AdvGrid;

type
  TFrmAgendaTel = class(TForm)
    fcImageForm1: TfcImageForm;
    StringTel1: TAdvStringGrid;
    StringTel2: TAdvStringGrid;
    StringTel3: TAdvStringGrid;
    StringTel4: TAdvStringGrid;
    StringTel5: TAdvStringGrid;
    StringTel6: TAdvStringGrid;
    StringTel7: TAdvStringGrid;
    StringTel8: TAdvStringGrid;
    BtnPrimeiro: TfcImageBtn;
    BtnAnterior: TfcImageBtn;
    BtnProximo: TfcImageBtn;
    BtnUltimo: TfcImageBtn;
    BtnNovo: TfcImageBtn;
    BtnSair: TfcImageBtn;
    btnAlfa: TfcButtonGroup;
    btnAlfafcShapeBtn1: TfcShapeBtn;
    btnAlfafcShapeBtn2: TfcShapeBtn;
    btnAlfafcShapeBtn3: TfcShapeBtn;
    btnAlfafcShapeBtn4: TfcShapeBtn;
    btnAlfafcShapeBtn5: TfcShapeBtn;
    btnAlfafcShapeBtn6: TfcShapeBtn;
    btnAlfafcShapeBtn7: TfcShapeBtn;
    btnAlfafcShapeBtn8: TfcShapeBtn;
    btnAlfafcShapeBtn9: TfcShapeBtn;
    btnAlfafcShapeBtn10: TfcShapeBtn;
    btnAlfafcShapeBtn11: TfcShapeBtn;
    btnAlfafcShapeBtn12: TfcShapeBtn;
    btnAlfafcShapeBtn13: TfcShapeBtn;
    btnAlfafcShapeBtn14: TfcShapeBtn;
    btnAlfafcShapeBtn15: TfcShapeBtn;
    btnAlfafcShapeBtn16: TfcShapeBtn;
    btnAlfafcShapeBtn17: TfcShapeBtn;
    btnAlfafcShapeBtn18: TfcShapeBtn;
    btnAlfafcShapeBtn19: TfcShapeBtn;
    btnAlfafcShapeBtn20: TfcShapeBtn;
    btnAlfafcShapeBtn21: TfcShapeBtn;
    btnAlfafcShapeBtn22: TfcShapeBtn;
    btnAlfafcShapeBtn23: TfcShapeBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringTel1DblClick(Sender: TObject);
    procedure StringTel2DblClick(Sender: TObject);
    procedure StringTel3DblClick(Sender: TObject);
    procedure StringTel4DblClick(Sender: TObject);
    procedure StringTel5DblClick(Sender: TObject);
    procedure StringTel6DblClick(Sender: TObject);
    procedure StringTel7DblClick(Sender: TObject);
    procedure StringTel8DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgendaTel: TFrmAgendaTel;

implementation

uses UnitCadTel;

{$R *.dfm}

procedure TFrmAgendaTel.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAgendaTel.FormShow(Sender: TObject);
begin
  StringTel1.Cells[0,0]:='Nome';
  StringTel1.Cells[0,1]:='End.';
  StringTel1.Cells[0,2]:='E-mail';
  StringTel1.Cells[0,0]:='Nome';
  StringTel1.Cells[0,1]:='End.';
  StringTel1.Cells[0,2]:='E-mail';
  StringTel2.Cells[0,0]:='Nome';
  StringTel2.Cells[0,1]:='End.';
  StringTel2.Cells[0,2]:='E-mail';
  StringTel3.Cells[0,0]:='Nome';
  StringTel3.Cells[0,1]:='End.';
  StringTel3.Cells[0,2]:='E-mail';
  StringTel4.Cells[0,0]:='Nome';
  StringTel4.Cells[0,1]:='End.';
  StringTel4.Cells[0,2]:='E-mail';
  StringTel5.Cells[0,0]:='Nome';
  StringTel5.Cells[0,1]:='End.';
  StringTel5.Cells[0,2]:='E-mail';
  StringTel6.Cells[0,0]:='Nome';
  StringTel6.Cells[0,1]:='End.';
  StringTel6.Cells[0,2]:='E-mail';
  StringTel7.Cells[0,0]:='Nome';
  StringTel7.Cells[0,1]:='End.';
  StringTel7.Cells[0,2]:='E-mail';
  StringTel8.Cells[0,0]:='Nome';
  StringTel8.Cells[0,1]:='End.';
  StringTel8.Cells[0,2]:='E-mail';
  StringTel1.Cells[2,0]:='Tel.';
  StringTel1.Cells[2,1]:='Cel.';
  StringTel1.Cells[2,2]:='Fax';
  StringTel2.Cells[2,0]:='Tel.';
  StringTel2.Cells[2,1]:='Cel.';
  StringTel2.Cells[2,2]:='Fax';
  StringTel3.Cells[2,0]:='Tel.';
  StringTel3.Cells[2,1]:='Cel.';
  StringTel3.Cells[2,2]:='Fax';
  StringTel4.Cells[2,0]:='Tel.';
  StringTel4.Cells[2,1]:='Cel.';
  StringTel4.Cells[2,2]:='Fax';
  StringTel5.Cells[2,0]:='Tel.';
  StringTel5.Cells[2,1]:='Cel.';
  StringTel5.Cells[2,2]:='Fax';
  StringTel6.Cells[2,0]:='Tel.';
  StringTel6.Cells[2,1]:='Cel.';
  StringTel6.Cells[2,2]:='Fax';
  StringTel7.Cells[2,0]:='Tel.';
  StringTel7.Cells[2,1]:='Cel.';
  StringTel7.Cells[2,2]:='Fax';
  StringTel8.Cells[2,0]:='Tel.';
  StringTel8.Cells[2,1]:='Cel.';
  StringTel8.Cells[2,2]:='Fax';
end;

procedure TFrmAgendaTel.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmAgendaTel.StringTel1DblClick(Sender: TObject);
begin
  FrmCadTel:=TFrmCadTel.create(application);
  FrmCadTel.Showmodal;
  StringTel1DblClick(Sender);
end;

procedure TFrmAgendaTel.StringTel2DblClick(Sender: TObject);
begin
  FrmCadTel:=TFrmCadTel.create(application);
  FrmCadTel.Showmodal;
  StringTel2DblClick(Sender);
end;

procedure TFrmAgendaTel.StringTel3DblClick(Sender: TObject);
begin
  FrmCadTel:=TFrmCadTel.create(application);
  FrmCadTel.Showmodal;
  StringTel3DblClick(Sender);
end;

procedure TFrmAgendaTel.StringTel4DblClick(Sender: TObject);
begin
  FrmCadTel:=TFrmCadTel.create(application);
  FrmCadTel.Showmodal;
  StringTel4DblClick(Sender);
end;

procedure TFrmAgendaTel.StringTel5DblClick(Sender: TObject);
begin
  FrmCadTel:=TFrmCadTel.create(application);
  FrmCadTel.Showmodal;
  StringTel5DblClick(Sender);
end;

procedure TFrmAgendaTel.StringTel6DblClick(Sender: TObject);
begin
  FrmCadTel:=TFrmCadTel.create(application);
  FrmCadTel.Showmodal;
  StringTel6DblClick(Sender);
end;

procedure TFrmAgendaTel.StringTel7DblClick(Sender: TObject);
begin
  FrmCadTel:=TFrmCadTel.create(application);
  FrmCadTel.Showmodal;
  StringTel7DblClick(Sender);
end;

procedure TFrmAgendaTel.StringTel8DblClick(Sender: TObject);
begin
  FrmCadTel:=TFrmCadTel.create(application);
  FrmCadTel.Showmodal;
  StringTel8DblClick(Sender);
end;

end.
