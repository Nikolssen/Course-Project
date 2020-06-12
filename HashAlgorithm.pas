unit HashAlgorithm;

interface

uses SysUtils, Types;

const
  RangeAverageSquareDistributed: constArray = (115000, 115000, 115000,
    135000, 140000);
  RangeSystemDistributed: constArray = (1100, 1100, 1100, 1300, 1333);

  RangeDivisionDistributed: constArray = (90, 90, 90, 80, 75);

  overbucket: constArray = (10, 10, 10, 5, 4);

  RangeAverageSquarePeterson = 100500;
  RangeSystemPeterson = 1000;
  RangeDivisionPeterson = 100;

procedure GetHashProcessResults(out chartArray: TChartArray);
procedure GetMostSufficient(const chartArray: TChartArray;
  out PetersonPieRecord, DistributedPieRecord: TPieRecord);

procedure HashDistributed(const HashFunction: THashFunction;
  const range, HashTableSize, FileVolume, overbucket: integer;
  out HashTable: THashTable; out percentageOverflow, mainDensity: real);

function SearchKeyDistributed(key: string; HashTable: THashTable;
  const HashFunction: THashFunction; const range, FileVolume,
  overbucket: integer; out checked: integer; out value: integer): boolean;

procedure HashPeterson(const HashFunction: THashFunction;
  const range, HashTableSize, FileVolume: integer; out HashTable: THashTable;
  out percentageOverflow, mainDensity: real);

function SearchKeyPeterson(key: string; HashTable: THashTable;
  const HashFunction: THashFunction; const range, FileVolume: integer;
  out checked: integer; out value: integer): boolean;

function HashAverageSquare(const key: string;
  const range, HashTableSize: integer): int64;

function HashSystemConversion(const key: string;
  const range, HashTableSize: integer): int64;

function HashDivision(const key: string;
  const range, HashTableSize: integer): int64;

implementation

function StringToDecimal(const key: string): int64;
var
  i, len: integer;
  tempString: string;
begin
  len := Length(key);
  tempString := '';
  i := 1;
  while i < len - 1 do
  begin
    tempString := tempString + IntToStr(ord(key[i]) + ord(key[i + 1]) +
      ord(key[i + 2]));
    inc(i, 3);
  end;
  result := StrToInt(tempString);
end;

function HashAverageSquare(const key: string;
  const range, HashTableSize: integer): int64;
var
  Seed: int64;
begin

  Seed := StringToDecimal(key);
  Seed := sqr(Seed);
  result := (Seed div 1000) mod 100000;
  result := round(result * HashTableSize / range);
end;

function HashSystemConversion(const key: string;
  const range, HashTableSize: integer): int64;
var
  str: string;
  i, len, power: integer;

begin
  str := IntToStr(StringToDecimal(key));
  len := Length(str);
  power := 1;
  result := 0;
  for i := len downto 1 do
  begin
    result := result + StrToInt(str[i]) * power;
    power := power * 17;
  end;
  result := result mod 1000;
  result := round(result * HashTableSize / range);
end;

function HashDivision(const key: string;
  const range, HashTableSize: integer): int64;
type
  TDivArray = array [1 .. 10] of integer;
const
  DivisorArray: TDivArray = (19, 37, 59, 79, 97, 113, 139, 157, 179, 199);
begin
  result := StringToDecimal(key);
  result := result mod DivisorArray[HashTableSize div 20];
  result := round(result * (range / 100));
end;

procedure HashDistributed(const HashFunction: THashFunction;
  const range, HashTableSize, FileVolume, overbucket: integer;
  out HashTable: THashTable; out percentageOverflow, mainDensity: real);
var
  myfile: InputFile;
  BucketSize: integer;
  i: integer;

  tempRec: InputRecord;
  address: integer;
  sum: integer;

begin

  BucketSize := round(PotentialVolume / HashTableSize);
  SetLength(HashTable, HashTableSize);
  for i := 0 to HashTableSize - 1 do
  begin
    HashTable[i].Volume := 0;
    SetLength(HashTable[i].Bucket, BucketSize);
  end;

  Assign(myfile, 'HashData.txt');
  Reset(myfile);
  tempRec.value := 0;
  while tempRec.value < FileVolume do
  begin
    Read(myfile, tempRec);
    address := HashFunction(tempRec.key, range, HashTableSize);


    address := address + trunc(address / (overbucket - 1));

    if address >= HashTableSize then
      address := 0;

    repeat
      if HashTable[address].Volume = BucketSize then
      begin
        if address >= HashTableSize - 1 then
          address := overbucket - 1;

        if ((address + 1) mod overbucket = 0) and (address <> 0) then
          inc(address, overbucket)
        else
          address := overbucket * (address div overbucket + 1) - 1;

      end;

    until HashTable[address].Volume < BucketSize;

    HashTable[address].Bucket[HashTable[address].Volume] := tempRec;
    inc(HashTable[address].Volume);

  end;

  sum := 0;
  i := overbucket - 1;
  while i < HashTableSize do
  begin
    sum := sum + HashTable[i].Volume;
    inc(i, overbucket);
  end;
  percentageOverflow := sum / FileVolume * 100;

  mainDensity := 0;
  i := 0;
  while i < HashTableSize do
  begin
    mainDensity := mainDensity + HashTable[i].Volume / BucketSize;
    inc(i);
    if (i + 1) mod overbucket = 0 then
      inc(i);

  end;
  mainDensity := mainDensity / (HashTableSize * (1 - 1 / overbucket)) * 100;

  CloseFile(myfile);
end;

procedure SearchDistributed(HashTable: THashTable;
  const HashFunction: THashFunction; const range, FileVolume,
  overbucket: integer; out checkedAverage, checkedAverageNotFound,
  checkedAverageFound: real);
var

  k: integer;
  key: string[6];
  f: textfile;
  checked: integer;
  temp: string;
  kmax: integer;
  value:integer;

begin
  Assign(f, 'Search.txt');
  Reset(f);
  read(f, temp);
  CloseFile(f);
  checkedAverage := 0;
  checkedAverageNotFound := 0;
  checkedAverageFound := 0;

  kmax := round(FileVolume * 1.2);
  for k := 1 to kmax do

  begin
    key := copy(temp, k * 6 - 5, 6);
    if SearchKeyDistributed(key, HashTable, HashFunction, range, FileVolume,
      overbucket, checked, value) then
    begin
      checkedAverageFound := checkedAverageFound + checked;
    end
    else
    begin
      checkedAverageNotFound := checkedAverageNotFound + checked;
    end;
    checkedAverage := checkedAverage + checked;

  end;
  checkedAverage := checkedAverage / round(FileVolume * 1.2);
  checkedAverageNotFound := checkedAverageNotFound / round(FileVolume * 0.2);
  checkedAverageFound := checkedAverageFound / FileVolume;

end;

procedure HashPeterson(const HashFunction: THashFunction;
  const range, HashTableSize, FileVolume: integer; out HashTable: THashTable;
  out percentageOverflow, mainDensity: real);
var
  myfile: InputFile;
  BucketSize: integer;
  i: integer;
  tempRec: InputRecord;
  address: integer;
  sum: integer;
begin

  BucketSize := round(PotentialVolume / HashTableSize);
  SetLength(HashTable, HashTableSize);
  for i := 0 to HashTableSize - 1 do
  begin
    HashTable[i].Volume := 0;
    SetLength(HashTable[i].Bucket, BucketSize);
  end;
  sum := 0;
  Assign(myfile, 'HashData.txt');
  Reset(myfile);
  tempRec.value := 0;
  while tempRec.value < FileVolume do
  begin
    Read(myfile, tempRec);
    address := HashFunction(tempRec.key, range, HashTableSize);
    if address >= HashTableSize then
      address := 0;
    repeat
      if HashTable[address].Volume = BucketSize then
      begin
        if address >= HashTableSize - 1 then
          address := 0
        else
          inc(address);

      end;

    until HashTable[address].Volume < BucketSize;

    HashTable[address].Bucket[HashTable[address].Volume] := tempRec;
    inc(HashTable[address].Volume);
    if address <> HashFunction(tempRec.key, range, HashTableSize) then
      inc(sum);
  end;

  CloseFile(myfile);
  percentageOverflow := sum / FileVolume * 100;
  mainDensity := (FileVolume - sum) / PotentialVolume * 100;
  { mainDensity := 0;

    for i := 0 to HashTableSize - 1 do
    mainDensity := mainDensity + HashTable[i].Volume / BucketSize; }

  // mainDensity := mainDensity / (HashTableSize) * 100;
end;

procedure SearchPeterson(HashTable: THashTable;
  const HashFunction: THashFunction; const range, FileVolume: integer;
  out checkedAverage, checkedAverageNotFound, checkedAverageFound: real);
var
  k, kmax: integer;
  key: string[6];
  f: textfile;
  checked: integer;
  temp: string;
  value: integer;
begin
  Assign(f, 'Search.txt');
  Reset(f);
  read(f, temp);
  CloseFile(f);
  checkedAverage := 0;
  checkedAverageNotFound := 0;
  checkedAverageFound := 0;

  kmax := round(FileVolume * 1.2);
  for k := 1 to kmax do

  begin
    key := copy(temp, k * 6 - 5, 6);

    if SearchKeyPeterson(key, HashTable, HashFunction, range, FileVolume,
      checked, value) then
    begin
      checkedAverageFound := checkedAverageFound + checked;
    end
    else
    begin
      checkedAverageNotFound := checkedAverageNotFound + checked;
    end;
    checkedAverage := checkedAverage + checked;

  end;
  checkedAverage := checkedAverage / round(FileVolume * 1.2);
  checkedAverageNotFound := checkedAverageNotFound / round(FileVolume * 0.2);
  checkedAverageFound := checkedAverageFound / FileVolume;

end;

function SearchKeyDistributed(key: string; HashTable: THashTable;
  const HashFunction: THashFunction; const range, FileVolume,
  overbucket: integer; out checked, value: integer): boolean;
var
  i, address, last, HashTableSize, BucketSize: integer;
  flag, flag2, flag3: boolean;

begin
  HashTableSize := Length(HashTable);
  BucketSize := round(PotentialVolume / HashTableSize);
  address := HashFunction(key, range, HashTableSize);

  address := address + trunc(address / (overbucket - 1));
   value:=-1;
  if address >= HashTableSize then
    address := 0;
  if address = 0 then
    last := overbucket - 1
  else
    last := overbucket * (address div overbucket + 1) - 1;
  flag := false;
  flag2 := true;
  flag3 := false;
  checked := 1;
  repeat
    i := 0;
    while (key <> HashTable[address].Bucket[i].key) and
      (i < HashTable[address].Volume) do
    begin
      inc(i);
      inc(checked);
    end;

    if key = HashTable[address].Bucket[i].key then
      begin
      flag := true;
      value:=HashTable[address].Bucket[i].value;
      end
    else if HashTable[address].Volume < BucketSize then
      flag3 := true
    else
    begin
      if (address >= (Length(HashTable) - overbucket + 1)) then
        address := overbucket - 1
      else
      begin
        if ((address + 1) mod overbucket = 0) and (address <> 0) then
          inc(address, overbucket)
        else
          address := overbucket * (address div overbucket + 1) - 1;
      end;
    end;
    if address = last then
      flag2 := not flag2;
    // flag -  если найден
    // flag 2 - выход если не найдет спустя весь круг
    // flag 3 - выход если не найден после неполного пакета
  until flag or ((address = last) and flag2) or flag3;
  result := flag;

end;

function SearchKeyPeterson(key: string; HashTable: THashTable;
  const HashFunction: THashFunction; const range, FileVolume: integer;
  out checked, value: integer): boolean;
var
  i, address, last, HashTableSize, BucketSize: integer;
  flag, flag2, flag3: boolean;
begin
  HashTableSize := Length(HashTable);
  BucketSize := round(PotentialVolume / Length(HashTable));
  address := HashFunction(key, range, HashTableSize);

  if address >= HashTableSize then
    address := 0;
  last := address;
   value:=-1;
  flag := false;
  flag2 := true;
  flag3 := false;
  checked := 1;
  repeat
    i := 0;
    while (key <> HashTable[address].Bucket[i].key) and
      (i < HashTable[address].Volume) do
    begin
      inc(i);
      inc(checked);
    end;

    if key = HashTable[address].Bucket[i].key then
       begin
      flag := true;
      value:=HashTable[address].Bucket[i].value;
      end
    else if HashTable[address].Volume < BucketSize then
      flag3 := true
    else
    begin
      if (address >= HashTableSize - 1) then
        address := 0
      else
        inc(address);
    end;

    if address = last then
      flag2 := not flag2;
    // flag -  если найден
    // flag 2 - выход если не найдет спустя весь круг
    // flag 3 - выход если не найден после неполного пакета
  until flag or ((address = last) and flag2) or flag3;
  result := flag;
end;

procedure GetHashProcessResults(out chartArray: TChartArray);

var

  HashTable: THashTable;
  i: integer;
  j: integer;
  FileVolume: integer;
begin

  FileVolume := 480;
  j := 1;

  while FileVolume <= 960 do
  begin

    chartArray[j].FileVolume := FileVolume;
    i := 1;
    chartArray[j].UnterChart[1].HashTableSize := 20;
    repeat
      HashDistributed(HashAverageSquare, RangeAverageSquareDistributed[j],
        chartArray[j].UnterChart[i].HashTableSize, FileVolume, overbucket[j],
        HashTable, chartArray[j].UnterChart[i].Distributed.averageSquare.
        percentageOverflow, chartArray[j].UnterChart[i]
        .Distributed.averageSquare.mainDensity);
      SearchDistributed(HashTable, HashAverageSquare,
        RangeAverageSquareDistributed[j], FileVolume, overbucket[j],
        chartArray[j].UnterChart[i].Distributed.averageSquare.checkedAverage,
        chartArray[j].UnterChart[i].Distributed.averageSquare.
        checkedAverageNotFound, chartArray[j].UnterChart[i]
        .Distributed.averageSquare.checkedAverageFound);
      SetLength(HashTable, 0);

      HashPeterson(HashAverageSquare, RangeAverageSquarePeterson,
        chartArray[j].UnterChart[i].HashTableSize, FileVolume, HashTable,
        chartArray[j].UnterChart[i].Peterson.averageSquare.percentageOverflow,
        chartArray[j].UnterChart[i].Peterson.averageSquare.mainDensity);
      SearchPeterson(HashTable, HashAverageSquare, RangeAverageSquarePeterson,
        FileVolume, chartArray[j].UnterChart[i].Peterson.averageSquare.
        checkedAverage, chartArray[j].UnterChart[i]
        .Peterson.averageSquare.checkedAverageNotFound,
        chartArray[j].UnterChart[i].Peterson.averageSquare.checkedAverageFound);
      SetLength(HashTable, 0);

      HashDistributed(HashSystemConversion, RangeSystemDistributed[j],
        chartArray[j].UnterChart[i].HashTableSize, FileVolume, overbucket[j],
        HashTable, chartArray[j].UnterChart[i]
        .Distributed.System.percentageOverflow,
        chartArray[j].UnterChart[i].Distributed.System.mainDensity);
      SearchDistributed(HashTable, HashSystemConversion,
        RangeSystemDistributed[j], FileVolume, overbucket[j],
        chartArray[j].UnterChart[i].Distributed.System.checkedAverage,
        chartArray[j].UnterChart[i].Distributed.System.checkedAverageNotFound,
        chartArray[j].UnterChart[i].Distributed.System.checkedAverageFound);
      SetLength(HashTable, 0);

      HashPeterson(HashSystemConversion, RangeSystemPeterson,
        chartArray[j].UnterChart[i].HashTableSize, FileVolume, HashTable,
        chartArray[j].UnterChart[i].Peterson.System.percentageOverflow,
        chartArray[j].UnterChart[i].Peterson.System.mainDensity);
      SearchPeterson(HashTable, HashSystemConversion, RangeSystemPeterson,
        FileVolume, chartArray[j].UnterChart[i].Peterson.System.checkedAverage,
        chartArray[j].UnterChart[i].Peterson.System.checkedAverageNotFound,
        chartArray[j].UnterChart[i].Peterson.System.checkedAverageFound);
      SetLength(HashTable, 0);

      HashDistributed(HashDivision, RangeDivisionDistributed[j],
        chartArray[j].UnterChart[i].HashTableSize, FileVolume, overbucket[j],
        HashTable, chartArray[j].UnterChart[i]
        .Distributed.division.percentageOverflow,
        chartArray[j].UnterChart[i].Distributed.division.mainDensity);
      SearchDistributed(HashTable, HashDivision, RangeDivisionDistributed[j],
        FileVolume, overbucket[j], chartArray[j].UnterChart[i]
        .Distributed.division.checkedAverage,
        chartArray[j].UnterChart[i].Distributed.division.checkedAverageNotFound,
        chartArray[j].UnterChart[i].Distributed.division.checkedAverageFound);
      SetLength(HashTable, 0);

      HashPeterson(HashDivision, RangeDivisionPeterson,
        chartArray[j].UnterChart[i].HashTableSize, FileVolume, HashTable,
        chartArray[j].UnterChart[i].Peterson.division.percentageOverflow,
        chartArray[j].UnterChart[i].Peterson.division.mainDensity);
      SearchPeterson(HashTable, HashDivision, RangeDivisionPeterson, FileVolume,
        chartArray[j].UnterChart[i].Peterson.division.checkedAverage,
        chartArray[j].UnterChart[i].Peterson.division.checkedAverageNotFound,
        chartArray[j].UnterChart[i].Peterson.division.checkedAverageFound);
      SetLength(HashTable, 0);
      inc(i);
      if i <= 10 then
        chartArray[j].UnterChart[i].HashTableSize := chartArray[j].UnterChart
          [i - 1].HashTableSize + 20;
    until i > 10;
    inc(FileVolume, 120);
    inc(j);
  end;

end;

procedure GetMostSufficient(const chartArray: TChartArray;
  out PetersonPieRecord, DistributedPieRecord: TPieRecord);

var
  i, j: integer;
begin
  PetersonPieRecord.averageSquare := 0;
  PetersonPieRecord.SystemConversion := 0;
  PetersonPieRecord.division := 0;
  for i := 1 to 5 do
    for j := 1 to 10 do
    begin
      if chartArray[i].UnterChart[j].Peterson.averageSquare.checkedAverage <
        chartArray[i].UnterChart[j].Peterson.System.checkedAverage then
      begin
        if chartArray[i].UnterChart[j].Peterson.averageSquare.checkedAverage <
          chartArray[i].UnterChart[j].Peterson.division.checkedAverage then
          inc(PetersonPieRecord.averageSquare)
        else
          inc(PetersonPieRecord.division);
      end
      else
      begin
        if chartArray[i].UnterChart[j].Peterson.System.checkedAverage <
          chartArray[i].UnterChart[j].Peterson.division.checkedAverage then
          inc(PetersonPieRecord.SystemConversion)
        else
          inc(PetersonPieRecord.division);
      end;
    end;
  DistributedPieRecord.averageSquare := 0;
  DistributedPieRecord.SystemConversion := 0;
  DistributedPieRecord.division := 0;
  for i := 1 to 5 do
    for j := 1 to 10 do
    begin
      if chartArray[i].UnterChart[j].Distributed.averageSquare.checkedAverage <
        chartArray[i].UnterChart[j].Distributed.System.checkedAverage then
      begin
        if chartArray[i].UnterChart[j].Distributed.averageSquare.checkedAverage
          < chartArray[i].UnterChart[j].Distributed.division.checkedAverage then
          inc(DistributedPieRecord.averageSquare)
        else
          inc(DistributedPieRecord.division);
      end
      else
      begin
        if chartArray[i].UnterChart[j].Distributed.System.checkedAverage <
          chartArray[i].UnterChart[j].Distributed.division.checkedAverage then
          inc(DistributedPieRecord.SystemConversion)
        else
          inc(DistributedPieRecord.division);
      end;
    end;
end;

end.
