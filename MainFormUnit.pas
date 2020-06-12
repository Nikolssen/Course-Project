unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  VCLTee.Series, Vcl.StdCtrls,
  VCLTee.Chart, Types, HashAlgorithm, VCLTee.TeeProcs,
  VCLTee.TeeGDIPlus, VCLTee.TeEngine;

type
  TMainForm = class(TForm)
    MenuPanel: TPanel;
    DensityPanel: TPanel;
    DensityLabel: TLabel;
    OverflowPanel: TPanel;
    OverflowLabel: TLabel;
    SearchPanel: TPanel;
    SearchLabel: TLabel;
    GoodSearchPanel: TPanel;
    GoodSearchLabel: TLabel;
    BadSearchPanel: TPanel;
    BadSearchLabel: TLabel;
    InfoPanel: TPanel;
    InfoLabel: TLabel;
    SummaryPanel: TPanel;
    SummaryLabel: TLabel;
    MemoPanel: TPanel;
    Memo1: TMemo;

    Chart1: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;

    Memo2: TMemo;
    DensControlPanel: TPanel;
    DensPanel1: TPanel;
    DensPanel2: TPanel;
    DensPanel3: TPanel;
    DensPanel4: TPanel;
    DensPanel5: TPanel;
    Label1: TLabel;
    Series5: TBarSeries;
    Series6: TBarSeries;
    GrafPanel: TPanel;
    GrafLabel: TLabel;
    ChartPanel: TPanel;
    ResultPanel: TPanel;
    GraphMenuPanel: TPanel;
    Chart2: TChart;
    Series7: TPieSeries;
    PieLabel: TLabel;
    ROPPanel: TPanel;
    OAPanel: TPanel;
    TestSearchPanel: TPanel;
    TitleLabel: TLabel;
    KeyEdit: TEdit;
    GetSearchResultPanel: TPanel;
    OverflowOrganizationMethodChoice: TRadioGroup;
    DensityChoice: TRadioGroup;
    BucketSizeChoice: TRadioGroup;
    HashFunctionChoice: TRadioGroup;
    Label3: TLabel;
    Panel1: TPanel;
    SearchTestPanel: TPanel;
    SearchTestPanelLabel: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure DensityPanelClick(Sender: TObject);
    procedure OverflowPanelClick(Sender: TObject);
    procedure GoodSearchPanelClick(Sender: TObject);
    procedure SearchPanelClick(Sender: TObject);
    procedure BadSearchClick(Sender: TObject);
    procedure InfoPanelClick(Sender: TObject);
    procedure SummaryPanelClick(Sender: TObject);
    procedure MouseEnter(Sender: TObject);
    procedure MouseLeave(Sender: TObject);
    procedure ToResize(Sender: TObject);
    procedure Chart1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Chart1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure SeriesMouseEnter(Sender: TObject);
    procedure SeriesMouseLeft(Sender: TObject);
    procedure Chart1Click(Sender: TObject);
    procedure DensPanel1Click(Sender: TObject);
    procedure DensPanel2Click(Sender: TObject);
    procedure DensPanel3Click(Sender: TObject);
    procedure DensPanel4Click(Sender: TObject);
    procedure DensPanel5Click(Sender: TObject);
    procedure SetDefault(Sender: TObject);
    procedure SetDefaultDensityPanel(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);

    procedure GrafPanelClick(Sender: TObject);
    procedure ROPPanelClick(Sender: TObject);
    procedure OAPanelClick(Sender: TObject);

    procedure SearchTestPanelClick(Sender: TObject);
    procedure GetSearchResultPanelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private

  public

  end;

var
  MainForm: TMainForm;

implementation

type
  TMethod = procedure(Sender: TObject) of object;

var
  ChartArray: TChartArray;
  PetersonPie, DistributedPie: TPieRecord;
  ChartTitleString: String;
  CurrentChoice: integer;
  ActiveMethod: TMethod;
  ActiveMenuPanel: TPanel;
  ActiveDensityControl: TPanel;
  OldParam: SearchParam;
  HashTable: THashTable;
{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  GetHashProcessResults(ChartArray);
  GetMostSufficient(ChartArray, PetersonPie, DistributedPie);
  CurrentChoice := 1;
  ActiveMenuPanel := nil;
  InfoPanelClick(Sender);
  ActiveDensityControl := DensPanel1;
  DensPanel1Click(DensPanel1);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  SetLength(HashTable, 0);
end;

procedure TMainForm.SetDefault(Sender: TObject);
begin

  ResultPanel.Visible := false;
  if ActiveMenuPanel <> nil then
    ActiveMenuPanel.Color := clHotLight
  else
  begin
    InfoPanel.Color := clNavy;
    SummaryPanel.Color := clNavy;
    GrafPanel.Color := clNavy;
    SearchTestPanel.Color := clNavy;
    TestSearchPanel.Visible := false;
    ResultPanel.Visible := false;
    ChartPanel.Visible := true;
    Memo2.Visible := false;
    ActiveDensityControl.Color := clHotLight;
    ActiveDensityControl := DensPanel1;
    CurrentChoice := 1;
    DensPanel1.Color := $00FF870F;
  end;
  ActiveMenuPanel := (Sender as TPanel);
  (Sender as TPanel).Color := $00FF870F;

  Self.Chart1.SeriesList[0].Clear;
  Self.Chart1.SeriesList[1].Clear;
  Self.Chart1.SeriesList[2].Clear;
  Self.Chart1.SeriesList[3].Clear;
  Self.Chart1.SeriesList[4].Clear;
  Self.Chart1.SeriesList[5].Clear;
  Chart1.Title.Text[0] := ChartTitleString;
end;

procedure TMainForm.SetDefaultDensityPanel(Sender: TObject);
begin

  ActiveDensityControl.Color := clHotLight;
  ActiveDensityControl := (Sender as TPanel);
  if (@ActiveMethod <> nil) then
    ActiveMethod(Sender);
  (Sender as TPanel).Color := $00FF870F;
end;

procedure TMainForm.DensityPanelClick(Sender: TObject);
var
  i: byte;
begin
  ActiveMethod := DensityPanelClick;
  ChartTitleString := 'Плотность заполнения основной области (в процентах)';
  SetDefault(DensityPanel);
  Self.Memo1.Lines.LoadFromFile('DensInfo.txt', TEncoding.UTF8);
  for i := 1 to 10 do
  begin
    Self.Chart1.SeriesList[0].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.averageSquare.mainDensity,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[1].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.averageSquare.mainDensity,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[2].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.System.mainDensity,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[3].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.System.mainDensity,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[4].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.Division.mainDensity,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[5].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.Division.mainDensity,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
  end;
end;

procedure TMainForm.OverflowPanelClick(Sender: TObject);
var
  i: byte;
begin
  ActiveMethod := OverflowPanelClick;
  ChartTitleString := 'Процент записей в области переполнения';
  SetDefault(OverflowPanel);
  Self.Memo1.Lines.LoadFromFile('OverflowInfo.txt', TEncoding.UTF8);
  for i := 1 to 10 do
  begin
    Self.Chart1.SeriesList[0].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.averageSquare.percentageOverflow,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[1].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.averageSquare.percentageOverflow,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[2].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.System.percentageOverflow,
      (IntToStr(ChartArray[i].UnterChart[CurrentChoice].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[3].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.System.percentageOverflow,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[4].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.Division.percentageOverflow,
      (IntToStr(ChartArray[i].UnterChart[CurrentChoice].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[5].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.Division.percentageOverflow,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
  end;
end;

procedure TMainForm.SearchPanelClick(Sender: TObject);
var
  i: byte;
begin

  ChartTitleString := 'Среднее число просмотренных записей при поиске';
  SetDefault(SearchPanel);
  ActiveMethod := SearchPanelClick;

  Self.Memo1.Lines.LoadFromFile('SearchInfo.txt', TEncoding.UTF8);

  for i := 1 to 10 do
  begin
    Self.Chart1.SeriesList[0].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.averageSquare.checkedAverage,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[1].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.averageSquare.checkedAverage,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[2].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.System.checkedAverage,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[3].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.System.checkedAverage,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[4].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.Division.checkedAverage,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[5].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.Division.checkedAverage,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
  end;

end;

procedure TMainForm.GetSearchResultPanelClick(Sender: TObject);
var
  CurrentParam: SearchParam;
  range, value: integer;
  key: string;
  checked: integer;
  spare: data;
  Curoverbucket: integer;

  isFound: Boolean;

begin
  key := KeyEdit.Text;
  if key.Length <> 6 then Panel1.Caption:='Проверьте ввод'
  else
  begin
  CurrentParam.OverflowOrganizationMethod :=
    OverflowOrganizationMethodChoice.ItemIndex;
  case HashFunctionChoice.ItemIndex of
    0:
      CurrentParam.HashFunction := HashAverageSquare;
    1:
      CurrentParam.HashFunction := HashSystemConversion;
    2:
      CurrentParam.HashFunction := HashDivision;
  end;
  case DensityChoice.ItemIndex of
    0:
      CurrentParam.FileVolume := 480;
    1:
      CurrentParam.FileVolume := 600;
    2:
      CurrentParam.FileVolume := 720;
    3:
      CurrentParam.FileVolume := 840;
    4:
      CurrentParam.FileVolume := 960;
  end;
  case BucketSizeChoice.ItemIndex of
    0:
      CurrentParam.HashTableSize := 20;
    1:
      CurrentParam.HashTableSize := 40;
    2:
      CurrentParam.HashTableSize := 60;
    3:
      CurrentParam.HashTableSize := 80;
    4:
      CurrentParam.HashTableSize := 100;
    5:
      CurrentParam.HashTableSize := 120;
    6:
      CurrentParam.HashTableSize := 140;
    7:
      CurrentParam.HashTableSize := 160;
    8:
      CurrentParam.HashTableSize := 180;
    9:
      CurrentParam.HashTableSize := 200;
  end;
  if CurrentParam.OverflowOrganizationMethod = 0 then
  begin
        case HashFunctionChoice.ItemIndex of
        0:
          range := RangeAverageSquareDistributed[DensityChoice.ItemIndex + 1];
        1:
          range := RangeSystemDistributed[DensityChoice.ItemIndex + 1];
        2:
          range := RangeDivisionDistributed[DensityChoice.ItemIndex + 1];
        end;
        Curoverbucket := overbucket[DensityChoice.ItemIndex + 1];

    if ((OldParam.FileVolume <> CurrentParam.FileVolume) or
      (@OldParam.HashFunction <> @CurrentParam.HashFunction) or
      (OldParam.HashTableSize <> CurrentParam.HashTableSize) or
      (OldParam.OverflowOrganizationMethod <>
      CurrentParam.OverflowOrganizationMethod)) then
    begin

        SetLength(HashTable, 0);
        HashDistributed(CurrentParam.HashFunction, range,
          CurrentParam.HashTableSize, CurrentParam.FileVolume, Curoverbucket,
          HashTable, spare.percentageOverflow, spare.mainDensity);

        end;
        isFound := SearchKeyDistributed(key, HashTable,
          CurrentParam.HashFunction, range, CurrentParam.FileVolume,
          Curoverbucket, checked, value);
        if isFound then Panel1.Caption := 'Найдено: ' + key + ' ' +
          IntToStr(value) + '. Просмотрено: ' + IntToStr(checked) +
          ' записей' else Panel1.Caption := 'Не найдено. Просмотрено: ' +
          IntToStr(checked) + ' записей';

        end;
        if CurrentParam.OverflowOrganizationMethod = 1 then
         begin
                 case HashFunctionChoice.ItemIndex of 0:
          range := RangeAverageSquarePeterson;
        1:
          range := RangeSystemPeterson;
        2:
          range := RangeDivisionPeterson;
      end;
        if ((OldParam.FileVolume <> CurrentParam.FileVolume) or
      (@OldParam.HashFunction <> @CurrentParam.HashFunction) or
      (OldParam.HashTableSize <> CurrentParam.HashTableSize) or
      (OldParam.OverflowOrganizationMethod <>
      CurrentParam.OverflowOrganizationMethod)) then
         begin SetLength(HashTable, 0);
      HashPeterson(CurrentParam.HashFunction, range, CurrentParam.HashTableSize,
        CurrentParam.FileVolume, HashTable, spare.percentageOverflow,
        spare.mainDensity);
    end;

    isFound := SearchKeyPeterson(key, HashTable, CurrentParam.HashFunction,
      range, CurrentParam.FileVolume, checked, value);
    if isFound then
      Panel1.Caption := 'Найдено: ' + key + ' ' + IntToStr(value) +
        '. Просмотрено: ' + IntToStr(checked) + ' записей'
    else
      Panel1.Caption := 'Не найдено. Просмотрено: ' + IntToStr(checked) +
        ' записей';

  end;
   OldParam:=CurrentParam;
  end;
end;

procedure TMainForm.GoodSearchPanelClick(Sender: TObject);
var
  i: byte;
begin
  ActiveMethod := GoodSearchPanelClick;
  ChartTitleString := 'Среднее число просмотренных записей при удачном поиске';
  SetDefault(GoodSearchPanel);
  Self.Memo1.Lines.LoadFromFile('SearchInfo.txt', TEncoding.UTF8);
  for i := 1 to 10 do
  begin
    Self.Chart1.SeriesList[0].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.averageSquare.checkedAverageFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[1].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.averageSquare.checkedAverageFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[2].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.System.checkedAverageFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[3].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.System.checkedAverageFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[4].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.Division.checkedAverageFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[5].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.Division.checkedAverageFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
  end;
end;

procedure TMainForm.BadSearchClick(Sender: TObject);
var
  i: byte;
begin
  ActiveMethod := BadSearchClick;
  ChartTitleString :=
    'Среднее число просмотренных записей при неудачном поиске';
  SetDefault(BadSearchPanel);
  Self.Memo1.Lines.LoadFromFile('SearchInfo.txt', TEncoding.UTF8);

  for i := 1 to 10 do
  begin
    Self.Chart1.SeriesList[0].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.averageSquare.checkedAverageNotFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[1].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.averageSquare.checkedAverageNotFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[2].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.System.checkedAverageNotFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[3].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.System.checkedAverageNotFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[4].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Distributed.Division.checkedAverageNotFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
    Self.Chart1.SeriesList[5].Add(ChartArray[CurrentChoice].UnterChart[i]
      .Peterson.Division.checkedAverageNotFound,
      (IntToStr(ChartArray[CurrentChoice].UnterChart[i].HashTableSize) + 'п. /'
      + IntToStr(round(PotentialVolume / ChartArray[CurrentChoice].UnterChart[i]
      .HashTableSize)) + 'з.'));
  end;
end;

procedure TMainForm.GrafPanelClick(Sender: TObject);
begin
  if ActiveMenuPanel <> nil then
  begin
    ActiveMenuPanel.Color := clHotLight;
    ChartPanel.Visible := false;
  end
  else
  begin
    InfoPanel.Color := clNavy;
    SummaryPanel.Color := clNavy;
    SearchTestPanel.Color := clNavy;
    TestSearchPanel.Visible := false;
    Memo2.Visible := false;
  end;
  ResultPanel.Visible := true;
  GrafPanel.Color := $00A36005;
  ActiveMenuPanel := nil;
  ROPPanelClick(Sender);
end;

procedure TMainForm.InfoPanelClick(Sender: TObject);
begin
  ActiveMethod := nil;
  Self.Memo2.Lines.LoadFromFile('info.txt', TEncoding.UTF8);

  Memo2.Visible := true;
  if ActiveMenuPanel <> nil then
  begin
    ActiveMenuPanel.Color := clHotLight;
    ActiveDensityControl.Color := clHotLight;
    ChartPanel.Visible := false;
  end
  else
  begin
    SummaryPanel.Color := clNavy;
    GrafPanel.Color := clNavy;
    ResultPanel.Visible := false;
    SearchTestPanel.Color := clNavy;
    TestSearchPanel.Visible := false;
  end;

  InfoPanel.Color := $00A36005;

  ActiveMenuPanel := nil;
end;

procedure TMainForm.SummaryPanelClick(Sender: TObject);
begin
  ActiveMethod := nil;
  Memo2.Visible := true;
  Self.Memo2.Lines.LoadFromFile('resume.txt', TEncoding.UTF8);
  if ActiveMenuPanel <> nil then
  begin
    ActiveMenuPanel.Color := clHotLight;
    ActiveDensityControl.Color := clHotLight;
    ChartPanel.Visible := false;
  end
  else
  begin
    InfoPanel.Color := clNavy;
    GrafPanel.Color := clNavy;
    SearchTestPanel.Color := clNavy;
    TestSearchPanel.Visible := false;
    ResultPanel.Visible := false;
  end;
  SummaryPanel.Color := $00A36005;
  ActiveDensityControl.Color := clHotLight;
  ActiveMenuPanel := nil;
end;

procedure TMainForm.SearchTestPanelClick(Sender: TObject);
begin
  TestSearchPanel.Visible := true;
  if ActiveMenuPanel <> nil then
  begin
    ActiveMenuPanel.Color := clHotLight;
    ActiveDensityControl.Color := clHotLight;

    Memo2.Visible := false;
    ChartPanel.Visible := false;
  end
  else
  begin
    InfoPanel.Color := clNavy;
    SummaryPanel.Color := clNavy;
    GrafPanel.Color := clNavy;
    ResultPanel.Visible := false;
  end;
  SearchTestPanel.Color := $00A36005;
  ActiveMenuPanel := nil;
end;

procedure TMainForm.DensPanel1Click(Sender: TObject);
begin
  CurrentChoice := 1;
  SetDefaultDensityPanel(DensPanel1);
end;

procedure TMainForm.DensPanel2Click(Sender: TObject);
begin
  CurrentChoice := 2;
  SetDefaultDensityPanel(DensPanel2);
end;

procedure TMainForm.DensPanel3Click(Sender: TObject);
begin
  CurrentChoice := 3;
  SetDefaultDensityPanel(DensPanel3);
end;

procedure TMainForm.DensPanel4Click(Sender: TObject);
begin
  CurrentChoice := 4;
  SetDefaultDensityPanel(DensPanel4);
end;

procedure TMainForm.DensPanel5Click(Sender: TObject);
begin
  CurrentChoice := 5;
  SetDefaultDensityPanel(DensPanel5);
end;

procedure TMainForm.MouseEnter(Sender: TObject);
begin
  (Sender as TPanel).BevelKind := bkSoft;
end;

procedure TMainForm.MouseLeave(Sender: TObject);
begin
  (Sender as TPanel).BevelKind := bkNone;
end;

procedure TMainForm.OAPanelClick(Sender: TObject);
begin
  Chart2.Series[0].Clear;
  Series7.AddPie(PetersonPie.averageSquare, 'Метод средних квадратов (ОА)',
    $00FF8000);
  Series7.AddPie(PetersonPie.SystemConversion,
    'Метод преобразования систем счисления (ОА)', $0052CF84);
  Series7.AddPie(PetersonPie.Division, 'Метод деления (ОА)', clYellow);
  OAPanel.Color := $00FF870F;
  ActiveDensityControl.Color := clHotLight;
  ActiveDensityControl := OAPanel;
end;

procedure TMainForm.ROPPanelClick(Sender: TObject);
begin
  Chart2.Series[0].Clear;
  Series7.AddPie(DistributedPie.averageSquare, 'Метод средних квадратов (РОП)',
    $00C08000);
  Series7.AddPie(DistributedPie.SystemConversion,
    'Метод преобразования систем счисления (РОП)', $005BA052);
  Series7.AddPie(DistributedPie.Division, 'Метод деления (РОП)', $000AC5D3);
  if @ActiveDensityControl <> nil then
    ActiveDensityControl.Color := clHotLight;
  ROPPanel.Color := $00FF870F;

  ActiveDensityControl := ROPPanel;
end;

procedure TMainForm.ToResize(Sender: TObject);
var
  x, y, fontres: real;
  DensityPanelOffset, MenuPanelOffset: integer;
begin
  x := ClientWidth / 1280;
  y := ClientHeight / 720;
  MenuPanel.Width := round(320 * x);
  MenuPanel.Height := round(720 * y);

  Chart1.Height := round(540 * y);
  Chart2.Height := Chart1.Height;

  GraphMenuPanel.Height := round(180 * y);

  PieLabel.Width := round(300 * x);
  PieLabel.Height := round(25 * y);
  PieLabel.Left := round(330 * x);
  PieLabel.Top := round(30 * y);

  ROPPanel.Left := round(110 * x);
  ROPPanel.Height := round(45 * y);
  ROPPanel.Top := round(100 * y);
  ROPPanel.Width := round(320 * x);

  OAPanel.Height := ROPPanel.Height;
  OAPanel.Top := ROPPanel.Top;
  OAPanel.Width := ROPPanel.Width;
  OAPanel.Left := round(510 * x);

  MemoPanel.Top := Chart1.Height;
  MemoPanel.Width := ClientWidth - MenuPanel.Width;
  MemoPanel.Height := round(120 * y);

  ResultPanel.Left := MenuPanel.Width;
  ResultPanel.Width := ClientWidth - MenuPanel.Width;
  ResultPanel.Height := ClientHeight;
  ChartPanel.Left := MenuPanel.Width;
  ChartPanel.Width := ResultPanel.Width;
  ChartPanel.Height := ClientHeight;
  Memo2.Width := ResultPanel.Width;
  Memo2.Height := ClientHeight;
  Memo2.Left := MenuPanel.Width;

  TestSearchPanel.Left := MenuPanel.Width;
  TestSearchPanel.Width := ClientWidth - MenuPanel.Width;
  TestSearchPanel.Height := ClientHeight;

  fontres := sqrt(x * y);
  MenuPanel.Font.Size := round(fontres * 12);
  Memo1.Font.Size := round(14 * fontres);
  Memo2.Font.Size := round(14 * fontres);
  MenuPanelOffset := round(15 * y);
  DensControlPanel.Font.Size := round(fontres * 14);
  GraphMenuPanel.Font.Size := round(14 * fontres);

  DensityPanel.Left := round(15 * x);
  DensityPanel.Top := round(25 * y);
  DensityPanel.Height := round(65 * y);
  DensityPanel.Width := round(285 * x);

  OverflowPanel.Left := DensityPanel.Left;
  OverflowPanel.Height := DensityPanel.Height;
  OverflowPanel.Width := DensityPanel.Width;
  OverflowPanel.Top := DensityPanel.Top + DensityPanel.Height + MenuPanelOffset;

  SearchPanel.Left := DensityPanel.Left;
  SearchPanel.Height := DensityPanel.Height;
  SearchPanel.Width := DensityPanel.Width;
  SearchPanel.Top := OverflowPanel.Top + OverflowPanel.Height + MenuPanelOffset;

  GoodSearchPanel.Left := DensityPanel.Left;
  GoodSearchPanel.Height := DensityPanel.Height;
  GoodSearchPanel.Width := DensityPanel.Width;
  GoodSearchPanel.Top := SearchPanel.Top + SearchPanel.Height + MenuPanelOffset;

  BadSearchPanel.Left := DensityPanel.Left;
  BadSearchPanel.Height := DensityPanel.Height;
  BadSearchPanel.Width := DensityPanel.Width;
  BadSearchPanel.Top := GoodSearchPanel.Top + GoodSearchPanel.Height +
    MenuPanelOffset;

  GrafPanel.Left := DensityPanel.Left;
  GrafPanel.Height := round(50 * y);
  GrafPanel.Width := DensityPanel.Width;
  GrafPanel.Top := BadSearchPanel.Top + BadSearchPanel.Height +
    MenuPanelOffset * 2;

  SearchTestPanel.Left := DensityPanel.Left;
  SearchTestPanel.Height := GrafPanel.Height;
  SearchTestPanel.Width := DensityPanel.Width;
  SearchTestPanel.Top := GrafPanel.Top + GrafPanel.Height + MenuPanelOffset;

  InfoPanel.Left := DensityPanel.Left;
  InfoPanel.Height := GrafPanel.Height;

  InfoPanel.Width := DensityPanel.Width;
  InfoPanel.Top := SearchTestPanel.Top + SearchTestPanel.Height +
    MenuPanelOffset;

  SummaryPanel.Left := DensityPanel.Left;
  SummaryPanel.Height := InfoPanel.Height;
  SummaryPanel.Width := DensityPanel.Width;
  SummaryPanel.Top := InfoPanel.Top + InfoPanel.Height + MenuPanelOffset;

  DensControlPanel.Top := MemoPanel.Top + MemoPanel.Height;
  DensControlPanel.Width := ClientWidth - DensControlPanel.Left;
  DensControlPanel.Height := ClientHeight - DensControlPanel.Top;

  DensityPanelOffset := round(12 * x);
  Label1.Left := DensityPanelOffset;
  Label1.Top := round(20 * y);
  Label1.Width := round(200 * x);
  Label1.Height := round(25 * y);

  DensPanel1.Left := round(220 * x);
  DensPanel1.Width := round(130 * x);
  DensPanel1.Height := round(40 * y);
  DensPanel1.Top := round(10 * y);

  DensPanel2.Left := DensPanel1.Left + DensPanel1.Width + DensityPanelOffset;
  DensPanel2.Width := DensPanel1.Width;
  DensPanel2.Height := DensPanel1.Height;
  DensPanel2.Top := DensPanel1.Top;

  DensPanel3.Left := DensPanel2.Left + DensPanel2.Width + DensityPanelOffset;
  DensPanel3.Width := DensPanel1.Width;
  DensPanel3.Height := DensPanel1.Height;
  DensPanel3.Top := DensPanel1.Top;

  DensPanel4.Left := DensPanel3.Left + DensPanel3.Width + DensityPanelOffset;
  DensPanel4.Width := DensPanel1.Width;
  DensPanel4.Height := DensPanel1.Height;
  DensPanel4.Top := DensPanel1.Top;

  DensPanel5.Left := DensPanel4.Left + DensPanel4.Width + DensityPanelOffset;
  DensPanel5.Width := DensPanel1.Width;
  DensPanel5.Height := DensPanel1.Height;
  DensPanel5.Top := DensPanel1.Top;

  TitleLabel.Top:=round(30*y);
  TitleLabel.Left:=Round(350*x);

  OverflowOrganizationMethodChoice.Left:=round(30*x);
  OverflowOrganizationMethodChoice.Top:=round(120*y);
  OverflowOrganizationMethodChoice.Width:=round(350*x);
  OverflowOrganizationMethodChoice.Top:=round(120*y);

  HashFunctionChoice.Left:= OverflowOrganizationMethodChoice.Left;
  HashFunctionChoice.Top:= round(270*y);
  HashFunctionChoice.Width:= OverflowOrganizationMethodChoice.Width;
  HashFunctionChoice.Height:=round(140*y);

  DensityChoice.Left:=round(420*x);
  DensityChoice.Top:=round(120*y);
  DensityChoice.Width:=round(180*x);
  DensityChoice.Height:=round(290*y);

  BucketSizeChoice.Left:=Round(640*x);
  BucketSizeChoice.Top:=DensityChoice.Top;
  BucketSizeChoice.Width:=DensityChoice.Width;
  BucketSizeChoice.Height:=DensityChoice.Height;

  Label3.Left:= HashFunctionChoice.Left;
  Label3.Top:=round(435*y);

  KeyEdit.Left:=round(95*x);
  KeyEdit.Top:= round(430*y);
  KeyEdit.Width:=Round(150*x);
  KeyEdit.Height:=round(30*x);

  GetSearchResultPanel.Left:= round(270*x);
  GetSearchResultPanel.Top:=  KeyEdit.Top;
  GetSearchResultPanel.Width:= round(90*x);
  GetSearchResultPanel.Height:=KeyEdit.Height;

  Panel1.Left:= Label3.Left;
  Panel1.Top:=round(480*y);
  Panel1.Width:=Round(500*x);
  Panel1.Height:=round(40*y);

  TestSearchPanel.Font.Size:=Round(fontres*14);
  KeyEdit.Font.Size:=Round(fontres*18);

end;

procedure TMainForm.LabelMouseEnter(Sender: TObject);
begin
  ((Sender as TLabel).Parent as TPanel).BevelKind := bkSoft;
end;

procedure TMainForm.Chart1Click(Sender: TObject);
begin
  if Self.Chart1.Pages.MaxPointsPerPage = 5 then
  begin
    if Self.Chart1.Page = 1 then
      Self.Chart1.Pages.NextPage
    else
      Self.Chart1.Pages.PreviousPage;
  end;

end;

procedure TMainForm.Chart1MouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  Self.Chart1.Pages.MaxPointsPerPage := 5;

end;

procedure TMainForm.Chart1MouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  Self.Chart1.Pages.MaxPointsPerPage := 10;

end;

procedure TMainForm.SeriesMouseEnter(Sender: TObject);
begin
  (Sender as TBarSeries).Marks.Visible := true;
end;

procedure TMainForm.SeriesMouseLeft(Sender: TObject);
begin
  (Sender as TBarSeries).Marks.Visible := false;
end;

end.
