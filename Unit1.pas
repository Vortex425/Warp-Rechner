unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw, WMPLib_TLB, Vcl.ComCtrls,
  Vcl.Imaging.GIFImg, WarpBerechnung, System.Math;

type
  TForm1 = class(TForm)
    ImgBackground: TImage;
    BtnNostalgie: TButton;
    WindowsMediaPlayer1: TWindowsMediaPlayer;
    BtnCloseVid: TButton;
    EdtWarpF: TEdit;
    EdtCochrane: TEdit;
    EdtKMdieS: TEdit;
    LblWF: TLabel;
    LblGschwCochrane: TLabel;
    EdtLJdieH: TEdit;
    LblGeschwLY: TLabel;
    LblGeschwKM: TLabel;
    BtnBerechnung: TButton;
    LblTitel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnNostalgieClick(Sender: TObject);
    procedure BtnCloseVidClick(Sender: TObject);
    procedure BtnBerechnungClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{$R Project1.res}

procedure TForm1.BtnBerechnungClick(Sender: TObject);
var
  WarpF, vCochrane, vLJ, vKM, a: Extended;
  // WarpF: Integer;
begin
  WarpF := StrToFloat(EdtWarpF.Text);
  if not TryStrToFloat(EdtWarpF.Text, a) then
  begin
    ShowMessage('Keine gültige Zahl');
    EdtWarpF.Clear;
  end;
  if WarpF <= 0 then
  begin
    ShowMessage('Der Warp Faktor darf nicht unter 1 liegen');
    EdtWarpF.Clear;
  end
  else if (WarpF >= 1) AND (WarpF <= 9) then
  begin
    WarpBis9(StrToFloat(EdtWarpF.Text), vCochrane, vLJ, vKM);
    EdtCochrane.Text := FloatToStr(vCochrane);
    ShowMessage(FloatToStr(RoundTo(vCochrane, -8)));
    EdtLJdieH.Text := FloatToStr(vLJ);
    EdtKMdieS.Text := FloatToStr(vKM);
  end
  else if (WarpF > 9) AND (WarpF < 10) then
  begin
    InterpolationWarp9(StrToFloat(EdtWarpF.Text), vCochrane, vLJ, vKM);
    EdtCochrane.Text := FloatToStr(vCochrane);
    EdtLJdieH.Text := FloatToStr(vLJ);
    EdtKMdieS.Text := FloatToStr(vKM);
  end
  else if WarpF = 10 then
  begin
    ShowMessage
      ('Der Warp Faktor darf nicht über 10 liegen, da es der unendlichen Geschwindigkeit entspräche');
    EdtWarpF.Clear;
  end
  else
  begin
    ShowMessage('Fehlerhafte Eingabe');
    EdtWarpF.Clear;
  end;

end;

procedure TForm1.BtnCloseVidClick(Sender: TObject);
begin
  WindowsMediaPlayer1.Controls.stop;
  WindowsMediaPlayer1.visible := false;
  BtnNostalgie.Enabled := true;
  BtnCloseVid.visible := false;
end;

procedure TForm1.BtnNostalgieClick(Sender: TObject);
var
  RS: TResourceStream;
begin
  BtnNostalgie.Enabled := false;
  BtnCloseVid.visible := true;
  if not FileExists(GetEnvironmentVariable('TEMP') + '\StarTrekIntro.mp4') then
    try
      RS := TResourceStream.Create(HInstance, 'StarTrekIntro', RT_RCDATA);
      RS.SaveToFile(GetEnvironmentVariable('TEMP') + '\StarTrekIntro.mp4');
      WindowsMediaPlayer1.URL := GetEnvironmentVariable('TEMP') +
        '\StarTrekIntro.mp4';
      WindowsMediaPlayer1.visible := true;
    finally
      RS.Free;
    end
  else
  begin
    WindowsMediaPlayer1.URL := GetEnvironmentVariable('TEMP') +
      '\StarTrekIntro.mp4';
    WindowsMediaPlayer1.visible := true;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  RS: TResourceStream;
  TMP: String;
  TMP2: PWideChar;
  FontPatch: PWideChar;
begin
  Randomize;
  TMP := GetEnvironmentVariable('TEMP') +'\1StarTrekFont.ttf';
  try
    RS := TResourceStream.Create(HInstance, 'StarTrekFont', RT_RCDATA);
    RS.SaveToFile(TMP);
    FontPatch := StringToOleStr(TMP);
    AddFontResource(FontPatch);
    LblTitel.Font.Name := 'StarTrek BT';
    RS := TResourceStream.Create(HInstance, 'Background', RT_RCDATA);
    ImgBackground.Picture.LoadFromStream(RS);
  finally
    RS.Free;
  end;
  LblTitel.Font.Name := 'StarTrek BT';
  LblTitel.Font.Color := $0016C9FD;
  LblWF.Font.Name := 'StarTrek BT';
  LblGschwCochrane.Font.Name := 'StarTrek BT';
  LblGeschwLY.Font.Name := 'StarTrek BT';
  LblGeschwKM.Font.Name := 'StarTrek BT';
  RemoveFontResource(StringToOleStr(TMP));
  DeleteFile(TMP);
end;

end.
