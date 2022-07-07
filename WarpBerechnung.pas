{*******************************************************}
{                                                       }
{              Library zur Warp-Berechnung              }
{                                                       }
{      This work © 2022 is licensed under Attribution-  }
{         NonCommercial-ShareAlike 4.0 International    }
{                                                       }
{                   Valentin Gross                      }
{                     07.07.2022                        }
{                                                       }
{*******************************************************}

unit WarpBerechnung;

interface

uses System.Math;
// Funktion für Warp 1 bis 9
procedure WarpBis9(Eingabe: Extended; VAR vCochrane, vLJ, vKM: Extended);
// Funktion für Warp > 9
procedure InterpolationWarp9(Eingabe: Extended;
  VAR vCochrane, vLJ, vKM: Extended);
function an(x: Extended): Extended; // Berechnung von an(x)
function bn(x: Extended): Extended; // Berechnung von bn(x)
// Interpolation der Partialsummen mit einem geeigneten rationalen Exponenten zur besseren Annäherung
function px(w, Eingabe: Extended): Extended;

implementation

const
  Lichtgeschwindigkeit = 299792.45; // Lichtgeschwindigkeit in km/s

procedure WarpBis9(Eingabe: Extended; VAR vCochrane, vLJ, vKM: Extended);

begin
  vCochrane := Power(Eingabe, (10 / 3));
  vLJ := vCochrane / (24 * 365.25);
  vKM := vCochrane * Lichtgeschwindigkeit;
end;

procedure InterpolationWarp9(Eingabe: Extended;
  VAR vCochrane, vLJ, vKM: Extended);
var
  a, w, b: Extended;
begin
  if (Eingabe >= 9) AND (Eingabe < 9.2) then
  begin
    a := (10 / 3);
    w := (Eingabe - 9) * 5;
    b := 3.3381;
  end
  else if (Eingabe >= 9.2) AND (Eingabe < 9.6) then
  begin
    a := 3.3381;
    w := (Eingabe - 9.2) * 2.5;
    b := 3.34;
  end
  else if (Eingabe >= 9.6) AND (Eingabe < 9.9) then
  begin
    a := 3.34;
    w := (Eingabe - 9.6) * 10 / 3;
    b := 3.5;
  end
  else if (Eingabe >= 9.9) AND (Eingabe < 10) then
  begin
    a := ((an(Eingabe) + sqr(an(Eingabe))) / 10) + 3.3;
    w := ((Power(10, an(Eingabe))) * Eingabe - Floor(Power(10, an(Eingabe)) *
      Eingabe)) / 0.9;
    w := px(w, Eingabe); // Interpolation (s.o)
    b := ((bn(Eingabe) + sqr(bn(Eingabe))) / 10) + 3.3;

  end;
  vCochrane := Power(Eingabe, (a + w * (b - a)));
  vLJ := vCochrane / (24 * 365.25);
  vKM := vCochrane * Lichtgeschwindigkeit;
end;

function an(x: Extended): Extended;
begin
  Result := Floor(-Log10(10 - x))
end;

function bn(x: Extended): Extended;
begin
  Result := Floor(-Log10(10 - x) + 1);
end;

function px(w, Eingabe: Extended): Extended;
var
  p: Single;
begin
  if (Eingabe >= 9.9) AND (Eingabe < 9.99) then
    p := 1.1
  else if Eingabe >= 9.99 then
    p := 1.5;
  Result := Power(w, p);
end;

end.
