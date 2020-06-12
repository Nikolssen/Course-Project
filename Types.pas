unit Types;

interface
const N = 10;
  PotentialVolume = 1200;

type
InputRecord = record
  key: string[6];
  value: integer;
end;
constArray = array [1..5] of integer;


data = record
percentageOverflow: real;
mainDensity: real;
checkedAverage: real;
checkedAverageNotFound:real;
checkedAverageFound: Real;
end;

OrganizationRecord = record
  averageSquare: data;
  system: data;
  division: data;
end;

UnterChartRecord = record
  HashTableSize: integer;
  Distributed : OrganizationRecord;
  Peterson : OrganizationRecord;
end;

TUnterChartArray = Array [1..N] of UnterChartRecord;

UberChartRecord = record
  fileVolume: integer;
  UnterChart: TUnterChartArray;
end;

 TChartArray = array [1..5] of UberChartRecord;


InputFile = file of InputRecord;

TBucket = record
  Bucket : array of InputRecord;
  Volume: SmallInt;
end;

TPieRecord = record
  AverageSquare: integer;
  SystemConversion: integer;
  Division: integer;
end;

THashTable = array of TBucket;

THashFunction = function(const key: string; const range, HashTableSize: integer): int64;

SearchParam = record
  OverflowOrganizationMethod: byte;
  HashFunction: THashFunction;
  HashTableSize: Integer;
  FileVolume: Integer;
end;
implementation
end.
