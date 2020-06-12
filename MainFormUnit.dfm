object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1061#1077#1096#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 720
  ClientWidth = 1280
  Color = 15979156
  Constraints.MaxHeight = 1080
  Constraints.MaxWidth = 1920
  Constraints.MinHeight = 576
  Constraints.MinWidth = 1024
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = ToResize
  PixelsPerInch = 96
  TextHeight = 13
  object ChartPanel: TPanel
    Left = 320
    Top = 0
    Width = 960
    Height = 720
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object DensControlPanel: TPanel
      Left = 0
      Top = 656
      Width = 960
      Height = 67
      BevelOuter = bvNone
      Color = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Bahnschrift SemiBold SemiConden'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 20
        Width = 170
        Height = 23
        BiDiMode = bdLeftToRight
        Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103
        ParentBiDiMode = False
      end
      object DensPanel1: TPanel
        AlignWithMargins = True
        Left = 210
        Top = 10
        Width = 130
        Height = 40
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = '40%'
        Color = clHotLight
        DoubleBuffered = True
        DragCursor = crHandPoint
        ParentBackground = False
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = DensPanel1Click
        OnMouseEnter = MouseEnter
        OnMouseLeave = MouseLeave
      end
      object DensPanel2: TPanel
        AlignWithMargins = True
        Left = 350
        Top = 10
        Width = 130
        Height = 40
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = '50%'
        Color = clHotLight
        DragCursor = crHandPoint
        ParentBackground = False
        TabOrder = 1
        OnClick = DensPanel2Click
        OnMouseEnter = MouseEnter
        OnMouseLeave = MouseLeave
      end
      object DensPanel3: TPanel
        AlignWithMargins = True
        Left = 490
        Top = 10
        Width = 130
        Height = 40
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = '60%'
        Color = clHotLight
        DoubleBuffered = True
        DragCursor = crHandPoint
        ParentBackground = False
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = DensPanel3Click
        OnMouseEnter = MouseEnter
        OnMouseLeave = MouseLeave
      end
      object DensPanel4: TPanel
        AlignWithMargins = True
        Left = 630
        Top = 10
        Width = 130
        Height = 40
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = '70%'
        Color = clHotLight
        DragCursor = crHandPoint
        ParentBackground = False
        TabOrder = 3
        OnClick = DensPanel4Click
        OnMouseEnter = MouseEnter
        OnMouseLeave = MouseLeave
      end
      object DensPanel5: TPanel
        AlignWithMargins = True
        Left = 770
        Top = 10
        Width = 130
        Height = 40
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = '80%'
        Color = clHotLight
        DragCursor = crHandPoint
        ParentBackground = False
        TabOrder = 4
        OnClick = DensPanel5Click
        OnMouseEnter = MouseEnter
        OnMouseLeave = MouseLeave
      end
    end
    object MemoPanel: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 540
      Width = 960
      Height = 120
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = clMenuBar
      ParentBackground = False
      TabOrder = 1
      object Memo1: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 954
        Height = 114
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Bahnschrift SemiCondensed'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Chart1: TChart
      Left = 0
      Top = 0
      Width = 960
      Height = 540
      AllowPanning = pmNone
      BackImage.Inside = True
      BackWall.Pen.Color = clScrollBar
      BackWall.Pen.Width = 11
      BackWall.Pen.Fill.Gradient.Direction = gdRightLeft
      BackWall.Pen.Fill.Gradient.StartColor = 15770453
      BackWall.Pen.SmallDots = True
      Gradient.Direction = gdRightLeft
      Gradient.EndColor = clWhite
      Gradient.StartColor = 16750899
      Gradient.Visible = True
      Legend.Alignment = laBottom
      Legend.Font.Color = 8404992
      Legend.Font.Height = -19
      Legend.Font.Name = 'Bahnschrift SemiBold Condensed'
      Legend.Inverted = True
      Legend.Transparency = 75
      MarginBottom = 3
      MarginLeft = 1
      MarginRight = 1
      MarginTop = 3
      ScrollMouseButton = mbLeft
      Title.Font.Color = 8404992
      Title.Font.Height = -21
      Title.Font.Name = 'Bahnschrift SemiBold SemiConden'
      Title.Text.Strings = (
        'TChart')
      BottomAxis.Grid.Visible = False
      BottomAxis.LabelsFormat.Font.Color = 8404992
      BottomAxis.LabelsFormat.Font.Height = -13
      BottomAxis.LabelsFormat.Font.Name = 'Bahnschrift SemiBold Condensed'
      BottomAxis.LabelsFormat.Font.Quality = fqBest
      BottomAxis.LabelsFormat.Font.Emboss.Smooth = False
      BottomAxis.LabelsFormat.Font.Shadow.Smooth = False
      BottomAxis.LabelsFormat.Frame.Width = 0
      BottomAxis.Title.Font.Color = 8404992
      BottomAxis.Title.Font.Name = 'Bahnschrift Light SemiCondensed'
      Chart3DPercent = 3
      DepthAxis.LabelsFormat.Font.Name = 'Bahnschrift'
      Frame.Color = clScrollBar
      Frame.Width = 11
      Frame.Fill.Gradient.Direction = gdRightLeft
      Frame.Fill.Gradient.StartColor = 15770453
      Frame.SmallDots = True
      LeftAxis.LabelsFormat.Font.Color = 8404992
      LeftAxis.LabelsFormat.Font.Height = -13
      LeftAxis.LabelsFormat.Font.Name = 'Bahnschrift Condensed'
      Pages.MaxPointsPerPage = 5
      Panning.MouseWheel = pmwNone
      TopAxis.Grid.Visible = False
      TopAxis.Title.Font.Name = 'Bahnschrift'
      View3D = False
      View3DOptions.ZoomText = ztAuto
      Zoom.Allow = False
      Zoom.Direction = tzdHorizontal
      Zoom.KeepAspectRatio = True
      Zoom.MouseButton = mbRight
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      OnClick = Chart1Click
      OnMouseWheelDown = Chart1MouseWheelDown
      OnMouseWheelUp = Chart1MouseWheelUp
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        22
        15
        22)
      ColorPaletteIndex = 17
      object Series1: TBarSeries
        Marks.Font.Color = 4194304
        Marks.Font.Height = -13
        Marks.Font.Name = 'Bahnschrift Condensed'
        Marks.Frame.Color = 4194304
        Marks.Frame.Width = 2
        Marks.Visible = False
        Marks.Margins.Left = 0
        Marks.Margins.Top = 0
        Marks.Margins.Right = 0
        Marks.Margins.Bottom = 0
        Marks.Style = smsValue
        Marks.BackColor = clWhite
        Marks.Callout.Distance = 10
        Marks.Callout.Length = 0
        Marks.Symbol.ShapeCallout.Size = 6
        Marks.Color = clWhite
        SeriesColor = 12615680
        Title = #1052#1077#1090#1086#1076' '#1089#1088#1077#1076#1085#1080#1093' '#1082#1074#1072#1076#1088#1072#1090#1086#1074' ('#1056#1054#1055')'
        ValueFormat = '0.0'
        OnMouseEnter = SeriesMouseEnter
        OnMouseLeave = SeriesMouseLeft
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series2: TBarSeries
        Marks.Font.Color = 4194304
        Marks.Font.Height = -13
        Marks.Font.Name = 'Bahnschrift Condensed'
        Marks.Frame.Color = 4194304
        Marks.Frame.Width = 2
        Marks.Visible = False
        Marks.Margins.Left = 0
        Marks.Margins.Top = 0
        Marks.Margins.Right = 0
        Marks.Margins.Bottom = 0
        Marks.Style = smsValue
        Marks.BackColor = clWhite
        Marks.Callout.Distance = 10
        Marks.Callout.Length = 0
        Marks.Symbol.Brush.Color = clNavy
        Marks.Symbol.Brush.Style = bsHorizontal
        Marks.Symbol.Brush.Image.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          0000100000000100180000000000000300000000000000000000000000000000
          0000AD9484AD9C84AD9C84AD947BAD9C84A5947BAD9484B59C8CB59C8CB59C8C
          B59C8CB5A58CBDA594BDA594BDA594BDA594B59C8CAD9C84AD9C84AD9C84AD9C
          84B5A58CAD9C84AD948CB59C94B59C8CB5A58CB59C8CB5A58CB5A58CBDA594BD
          A594AD9484B5947BAD9C84AD9C84B59C8CBDA594B59C8CB59C8CB59C8CB5A58C
          B5A58CBDA594B59C8CB5A58CBDA594BDA594B59C8CAD947BAD9C84B5A58CB59C
          8CAD9484AD9484B59C8CAD9C84AD9C84B59C8CB59C94BDA594B59C8CB5A58CBD
          A594B59C8CAD9C84B59C8CB59C8CB59C8CAD9C84B59C8CBDA594B59C8CAD9C84
          B59C8CB59C8CB59C8CB5A58CB5A58CBDA594B59C8CB59C8CB59C8CB59C8CAD94
          84AD9C84AD9484BDA594B59C8CB59C8CB59C8CAD9C84B59C8CB59C8CB5A58CBD
          A58CAD9C84B5948CB59C8CB59C8CAD9C84B59C8CB5948CB59C8CAD9C84AD9C84
          B59C8CAD9C84AD9C84B59C8CBDA584BDA584AD9484AD9484AD9484B59C8CB59C
          8CAD9484AD9484AD9C84AD9C84B59C8CB59C8CAD9484B59C8CAD9C84AD9C84AD
          9C84AD9C84AD9C84AD9C84B59C8CAD9484B59C8CB59C8CB59C8CB59C8CAD9484
          AD9484B59C8CB59C8CAD9484AD9484AD9484BDA584BDA584B59C8CAD9C84AD9C
          84B59C8CAD9C84B59C8CAD948CB5948CB59C8CAD9C84B59C8CB59C8CB5948CAD
          9C84BDA58CB5A58CB59C8CB59C8CAD9C84B59C8CB59C8CB59C8CB59C8CAD9484
          AD9C84AD9484B59C8CB59C8CB59C8CB59C8CBDA594B5A58CB5A58CB59C8CB59C
          8CB59C8CAD9C84B59C8CB59C94B59C8CAD9C84B59C8CB59C8CB59C8CAD9C84B5
          9C8CBDA594B5A58CB59C8CBDA594B59C94B59C8CAD9C84B59C8CB59C8CAD9484
          AD9484B59C8CB5A58CAD9C84AD947BB59C8CBDA594BDA594B5A58CB59C8CBDA5
          94B5A58CB5A58CB59C8CB59C8CB59C8CBDA594B59C8CAD9C84AD9C84B5947BAD
          9484BDA594BDA594B5A58CB5A58CB59C8CB5A58CB59C8CAD9484B59C8CAD9C84
          B5A58CAD9C84AD9C84AD9C84AD9C84B59C8CBDA594BDA594BDA594BDA594B5A5
          8CB59C8CB59C8CAD9484AD9484AD9484A5947BAD9C84AD947BAD9C84AD9C84AD
          9484}
        Marks.Symbol.Frame.Color = clNavy
        Marks.Symbol.Pen.Color = clNavy
        Marks.Color = clWhite
        SeriesColor = 16744448
        Title = #1052#1077#1090#1086#1076' '#1089#1088#1077#1076#1085#1080#1093' '#1082#1074#1072#1076#1088#1072#1090#1086#1074' ('#1054#1040')'
        ValueFormat = '0.0'
        OnMouseEnter = SeriesMouseEnter
        OnMouseLeave = SeriesMouseLeft
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series3: TBarSeries
        Marks.Font.Color = 4194304
        Marks.Font.Height = -13
        Marks.Font.Name = 'Bahnschrift Condensed'
        Marks.Frame.Color = 4194304
        Marks.Frame.Width = 2
        Marks.Visible = False
        Marks.Margins.Left = 0
        Marks.Margins.Top = 0
        Marks.Margins.Right = 0
        Marks.Margins.Bottom = 0
        Marks.Style = smsValue
        Marks.BackColor = clWhite
        Marks.Callout.Distance = 10
        Marks.Callout.Length = 0
        Marks.Color = clWhite
        SeriesColor = 6004818
        Title = #1052#1077#1090#1086#1076' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103' '#1089#1080#1089#1090#1077#1084' '#1089#1095#1080#1089#1083#1077#1085#1080#1103' ('#1056#1054#1055')'
        ValueFormat = '0.0'
        OnMouseEnter = SeriesMouseEnter
        OnMouseLeave = SeriesMouseLeft
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series4: TBarSeries
        Marks.Font.Color = 4194304
        Marks.Font.Height = -13
        Marks.Font.Name = 'Bahnschrift Condensed'
        Marks.Frame.Color = 4194304
        Marks.Frame.Width = 2
        Marks.Visible = False
        Marks.Margins.Left = 0
        Marks.Margins.Top = 0
        Marks.Margins.Right = 0
        Marks.Margins.Bottom = 0
        Marks.Style = smsValue
        Marks.BackColor = clWhite
        Marks.Callout.Distance = 10
        Marks.Callout.Length = 0
        Marks.Symbol.Brush.Color = clNavy
        Marks.Color = clWhite
        SeriesColor = 5427076
        Title = #1052#1077#1090#1086#1076' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103' '#1089#1080#1089#1090#1077#1084' '#1089#1095#1080#1089#1083#1077#1085#1080#1103' ('#1054#1040')'
        ValueFormat = '0.0'
        OnMouseEnter = SeriesMouseEnter
        OnMouseLeave = SeriesMouseLeft
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series5: TBarSeries
        Marks.Font.Color = 4194304
        Marks.Font.Height = -13
        Marks.Font.Name = 'Bahnschrift Condensed'
        Marks.Frame.Color = 4194304
        Marks.Frame.Width = 2
        Marks.Visible = False
        Marks.Margins.Left = 0
        Marks.Margins.Top = 0
        Marks.Margins.Right = 0
        Marks.Margins.Bottom = 0
        Marks.Style = smsValue
        Marks.BackColor = clWhite
        Marks.Callout.Distance = 10
        Marks.Callout.Length = 0
        Marks.Color = clWhite
        SeriesColor = 706003
        Title = #1052#1077#1090#1086#1076' '#1076#1077#1083#1077#1085#1080#1103' ('#1056#1054#1055')'
        ValueFormat = '0.0'
        OnMouseEnter = SeriesMouseEnter
        OnMouseLeave = SeriesMouseLeft
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series6: TBarSeries
        Marks.Font.Color = 4194304
        Marks.Font.Height = -13
        Marks.Font.Name = 'Bahnschrift Condensed'
        Marks.Frame.Color = 4194304
        Marks.Frame.Width = 2
        Marks.Visible = False
        Marks.Margins.Left = 0
        Marks.Margins.Top = 0
        Marks.Margins.Right = 0
        Marks.Margins.Bottom = 0
        Marks.Style = smsValue
        Marks.BackColor = clWhite
        Marks.Callout.Distance = 10
        Marks.Callout.Length = 0
        Marks.Symbol.Brush.Color = 10485760
        Marks.Symbol.Emboss.Color = clBlue
        Marks.Symbol.Frame.Color = 10485760
        Marks.Symbol.Frame.Fill.Gradient.EndColor = 753908
        Marks.Symbol.Frame.Fill.Gradient.MidColor = 16059031
        Marks.Symbol.Frame.Fill.Gradient.StartColor = 14540754
        Marks.Symbol.Pen.Color = 10485760
        Marks.Symbol.Pen.Fill.Gradient.EndColor = 753908
        Marks.Symbol.Pen.Fill.Gradient.MidColor = 16059031
        Marks.Symbol.Pen.Fill.Gradient.StartColor = 14540754
        Marks.Color = clWhite
        SeriesColor = clYellow
        Title = #1052#1077#1090#1086#1076' '#1076#1077#1083#1077#1085#1080#1103' ('#1054#1040')'
        ValueFormat = '0.0'
        OnMouseEnter = SeriesMouseEnter
        OnMouseLeave = SeriesMouseLeft
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
    end
  end
  object Memo2: TMemo
    Left = 320
    Top = 0
    Width = 960
    Height = 621
    Cursor = crArrow
    TabStop = False
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = 15979156
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = 8404992
    Font.Height = -17
    Font.Name = 'Bahnschrift SemiCondensed'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object MenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 720
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clHighlight
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Bahnschrift SemiBold SemiConden'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object InfoPanel: TPanel
      Left = 15
      Top = 588
      Width = 285
      Height = 50
      Cursor = crHandPoint
      BevelOuter = bvNone
      Color = clNavy
      DoubleBuffered = True
      DragCursor = crHandPoint
      ParentBackground = False
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = InfoPanelClick
      OnMouseEnter = MouseEnter
      OnMouseLeave = MouseLeave
      object InfoLabel: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 24
        Width = 272
        Height = 23
        Margins.Left = 10
        Align = alBottom
        Caption = #1054' '#1088#1072#1073#1086#1090#1077
        OnClick = InfoPanelClick
        OnMouseEnter = LabelMouseEnter
        ExplicitWidth = 65
      end
    end
    object SummaryPanel: TPanel
      Left = 15
      Top = 650
      Width = 285
      Height = 49
      Cursor = crHandPoint
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = clNavy
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = SummaryPanelClick
      OnMouseEnter = MouseEnter
      OnMouseLeave = MouseLeave
      object SummaryLabel: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 23
        Width = 272
        Height = 23
        Margins.Left = 10
        Align = alBottom
        Caption = #1042#1099#1074#1086#1076
        DragCursor = crHandPoint
        OnClick = SummaryPanelClick
        OnMouseEnter = LabelMouseEnter
        ExplicitWidth = 50
      end
    end
    object BadSearchPanel: TPanel
      Left = 15
      Top = 350
      Width = 285
      Height = 75
      Cursor = crHandPoint
      BevelOuter = bvNone
      Color = clHotLight
      DoubleBuffered = True
      DragCursor = crHandPoint
      ParentBackground = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnClick = BadSearchClick
      OnMouseEnter = MouseEnter
      OnMouseLeave = MouseLeave
      object BadSearchLabel: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 49
        Width = 272
        Height = 23
        Margins.Left = 10
        Align = alBottom
        Caption = #1053#1077#1091#1076#1072#1095#1085#1099#1081' '#1087#1086#1080#1089#1082
        OnClick = BadSearchClick
        OnMouseEnter = LabelMouseEnter
        ExplicitWidth = 133
      end
    end
    object GoodSearchPanel: TPanel
      Left = 15
      Top = 270
      Width = 285
      Height = 75
      Cursor = crHandPoint
      BevelOuter = bvNone
      Color = clHotLight
      DoubleBuffered = True
      DragCursor = crHandPoint
      ParentBackground = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      OnClick = GoodSearchPanelClick
      OnMouseEnter = MouseEnter
      OnMouseLeave = MouseLeave
      object GoodSearchLabel: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 49
        Width = 272
        Height = 23
        Margins.Left = 10
        Align = alBottom
        Caption = #1059#1076#1072#1095#1085#1099#1081' '#1087#1086#1080#1089#1082
        OnClick = GoodSearchPanelClick
        OnMouseEnter = LabelMouseEnter
        ExplicitWidth = 116
      end
    end
    object SearchPanel: TPanel
      Left = 15
      Top = 190
      Width = 285
      Height = 75
      Cursor = crHandPoint
      BevelOuter = bvNone
      Color = clHotLight
      DoubleBuffered = True
      DragCursor = crHandPoint
      ParentBackground = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      OnClick = SearchPanelClick
      OnMouseEnter = MouseEnter
      OnMouseLeave = MouseLeave
      object SearchLabel: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 49
        Width = 272
        Height = 23
        Margins.Left = 10
        Align = alBottom
        Caption = #1055#1086#1080#1089#1082
        DragCursor = crHandPoint
        OnClick = SearchPanelClick
        OnMouseEnter = LabelMouseEnter
        ExplicitWidth = 45
      end
    end
    object OverflowPanel: TPanel
      Left = 15
      Top = 109
      Width = 285
      Height = 75
      Cursor = crHandPoint
      BevelOuter = bvNone
      Color = clHotLight
      DoubleBuffered = True
      DragCursor = crHandPoint
      ParentBackground = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      OnClick = OverflowPanelClick
      OnMouseEnter = MouseEnter
      OnMouseLeave = MouseLeave
      object OverflowLabel: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 49
        Width = 272
        Height = 23
        Margins.Left = 10
        Align = alBottom
        Caption = #1054#1073#1083#1072#1089#1090#1100' '#1087#1077#1088#1077#1087#1086#1083#1085#1077#1085#1080#1103
        OnClick = OverflowPanelClick
        OnMouseEnter = LabelMouseEnter
        ExplicitWidth = 173
      end
    end
    object DensityPanel: TPanel
      AlignWithMargins = True
      Left = 15
      Top = 30
      Width = 285
      Height = 75
      Cursor = crHandPoint
      BevelOuter = bvNone
      Color = clHotLight
      DoubleBuffered = True
      DragCursor = crHandPoint
      ParentBackground = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
      OnClick = DensityPanelClick
      OnMouseEnter = MouseEnter
      OnMouseLeave = MouseLeave
      object DensityLabel: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 49
        Width = 272
        Height = 23
        Margins.Left = 10
        Align = alBottom
        Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1086#1073#1083#1072#1089#1090#1100
        OnClick = DensityPanelClick
        OnMouseEnter = LabelMouseEnter
        ExplicitWidth = 136
      end
    end
    object GrafPanel: TPanel
      Left = 15
      Top = 458
      Width = 285
      Height = 50
      Cursor = crHandPoint
      BevelOuter = bvNone
      Color = clNavy
      ParentBackground = False
      TabOrder = 7
      OnClick = GrafPanelClick
      OnMouseEnter = MouseEnter
      OnMouseLeave = MouseLeave
      object GrafLabel: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 24
        Width = 272
        Height = 23
        Cursor = crHandPoint
        Margins.Left = 10
        Align = alBottom
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
        OnClick = GrafPanelClick
        OnMouseEnter = LabelMouseEnter
        ExplicitWidth = 87
      end
    end
    object SearchTestPanel: TPanel
      Left = 15
      Top = 520
      Width = 285
      Height = 49
      Cursor = crHandPoint
      BevelOuter = bvNone
      Color = clNavy
      ParentBackground = False
      TabOrder = 8
      OnClick = SearchTestPanelClick
      OnMouseEnter = MouseEnter
      OnMouseLeave = MouseLeave
      object SearchTestPanelLabel: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 23
        Width = 272
        Height = 23
        Cursor = crHandPoint
        Margins.Left = 10
        Align = alBottom
        Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1086#1080#1089#1082#1072
        OnClick = SearchTestPanelClick
        OnMouseEnter = LabelMouseEnter
        ExplicitWidth = 160
      end
    end
  end
  object ResultPanel: TPanel
    Left = 320
    Top = 0
    Width = 960
    Height = 720
    BevelOuter = bvNone
    TabOrder = 1
    object GraphMenuPanel: TPanel
      Left = 0
      Top = 540
      Width = 960
      Height = 180
      Align = alBottom
      BevelOuter = bvNone
      Color = clHighlight
      FullRepaint = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Bahnschrift SemiBold SemiConden'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object PieLabel: TLabel
        Left = 350
        Top = 28
        Width = 288
        Height = 23
        Caption = #1053#1072#1080#1073#1086#1083#1077#1077' '#1101#1092#1092#1077#1082#1090#1080#1074#1085#1072#1103' '#1093#1077#1096'-'#1092#1091#1085#1082#1094#1080#1103
      end
      object OAPanel: TPanel
        Left = 510
        Top = 100
        Width = 320
        Height = 45
        BevelOuter = bvNone
        Caption = #1054#1090#1082#1088#1099#1090#1072#1103' '#1072#1076#1088#1077#1089#1072#1094#1080#1103
        Color = clHotLight
        ParentBackground = False
        TabOrder = 0
        OnClick = OAPanelClick
        OnMouseEnter = MouseEnter
        OnMouseLeave = MouseLeave
      end
      object ROPPanel: TPanel
        Left = 110
        Top = 100
        Width = 320
        Height = 45
        BevelOuter = bvNone
        Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1085#1072#1103' '#1086#1073#1083#1072#1089#1090#1100' '#1087#1077#1088#1077#1087#1086#1083#1085#1077#1085#1080#1103
        Color = clHotLight
        ParentBackground = False
        TabOrder = 1
        OnClick = ROPPanelClick
        OnMouseEnter = MouseEnter
        OnMouseLeave = MouseLeave
      end
    end
    object Chart2: TChart
      Left = 0
      Top = 0
      Width = 960
      Height = 540
      AllowPanning = pmNone
      Gradient.Direction = gdRightLeft
      Gradient.EndColor = clWhite
      Gradient.StartColor = 16750899
      Gradient.Visible = True
      Legend.Alignment = laBottom
      Legend.DividingLines.Width = 0
      Legend.Font.Color = 8404992
      Legend.Font.Height = -19
      Legend.Font.Name = 'Bahnschrift SemiBold Condensed'
      Legend.HorizJustify = ljYes
      Legend.TextStyle = ltsPlain
      Legend.Title.Font.Color = clBlue
      Legend.Title.Font.Height = -16
      Legend.Title.Font.Name = 'Bahnschrift'
      Legend.Transparency = 75
      Title.Font.Color = 8404992
      Title.Font.Height = -21
      Title.Font.Name = 'Bahnschrift SemiBold SemiConden'
      Title.Font.Quality = fqBest
      Title.Text.Strings = (
        
          #1063#1080#1089#1083#1086' '#1089#1083#1091#1095#1072#1077#1074', '#1075#1076#1077' '#1093#1077#1096'-'#1092#1091#1085#1082#1094#1080#1103' '#1085#1072#1080#1073#1086#1083#1077#1077' '#1101#1092#1092#1077#1082#1090#1080#1074#1085#1072' '#1087#1088#1080' '#1087#1086#1080#1089#1082#1077' '#1089#1088 +
          #1077#1076#1080' '#1076#1088#1091#1075#1080#1093)
      Panning.MouseWheel = pmwNone
      View3D = False
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      View3DOptions.ZoomText = ztAuto
      Zoom.Allow = False
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series7: TPieSeries
        Marks.Font.Height = -16
        Marks.Font.Name = 'Bahnschrift SemiBold Condensed'
        Marks.Frame.Color = 8404992
        Marks.Frame.Width = 2
        Marks.Margins.Left = 5
        Marks.Margins.Right = 5
        Marks.Style = smsValue
        Marks.BackColor = clWhite
        Marks.Callout.ArrowHeadSize = 0
        Marks.Callout.Length = 0
        Marks.Color = clWhite
        XValues.Order = loAscending
        YValues.Name = 'Pie'
        YValues.Order = loNone
        Frame.InnerBrush.BackColor = clRed
        Frame.InnerBrush.Gradient.EndColor = clGray
        Frame.InnerBrush.Gradient.MidColor = clWhite
        Frame.InnerBrush.Gradient.StartColor = 4210752
        Frame.InnerBrush.Gradient.Visible = True
        Frame.MiddleBrush.BackColor = clYellow
        Frame.MiddleBrush.Gradient.EndColor = 8553090
        Frame.MiddleBrush.Gradient.MidColor = clWhite
        Frame.MiddleBrush.Gradient.StartColor = clGray
        Frame.MiddleBrush.Gradient.Visible = True
        Frame.OuterBrush.BackColor = clGreen
        Frame.OuterBrush.Gradient.EndColor = 4210752
        Frame.OuterBrush.Gradient.MidColor = clWhite
        Frame.OuterBrush.Gradient.StartColor = clSilver
        Frame.OuterBrush.Gradient.Visible = True
        Frame.Width = 4
        DarkPen = 32
        OtherSlice.Legend.Visible = False
        Data = {0000000000}
        Detail = {0000000000}
      end
    end
  end
  object TestSearchPanel: TPanel
    Left = 320
    Top = 0
    Width = 960
    Height = 720
    BevelOuter = bvNone
    Color = 16754492
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Bahnschrift SemiBold SemiConden'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    Visible = False
    object TitleLabel: TLabel
      Left = 350
      Top = 30
      Width = 167
      Height = 23
      Caption = #1044#1077#1084#1086#1085#1089#1090#1088#1072#1094#1080#1103' '#1087#1086#1080#1089#1082#1072
      Color = clBtnFace
      ParentColor = False
    end
    object Label3: TLabel
      Left = 30
      Top = 433
      Width = 45
      Height = 23
      Caption = #1050#1083#1102#1095':'
    end
    object KeyEdit: TEdit
      Left = 95
      Top = 430
      Width = 150
      Height = 31
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1082#1083#1102#1095
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 13395456
      Font.Height = -19
      Font.Name = 'Bahnschrift SemiCondensed'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object GetSearchResultPanel: TPanel
      Left = 270
      Top = 430
      Width = 90
      Height = 30
      BevelOuter = bvNone
      Caption = #1055#1086#1080#1089#1082
      Color = clHighlight
      ParentBackground = False
      TabOrder = 1
      OnClick = GetSearchResultPanelClick
      OnMouseEnter = MouseEnter
      OnMouseLeave = MouseLeave
    end
    object OverflowOrganizationMethodChoice: TRadioGroup
      Left = 30
      Top = 120
      Width = 350
      Height = 120
      Caption = #1052#1077#1090#1086#1076' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080' '#1086#1073#1083#1072#1089#1090#1080' '#1087#1077#1088#1077#1087#1086#1083#1085#1077#1085#1080#1103':'
      Color = clHighlight
      ItemIndex = 0
      Items.Strings = (
        #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1085#1072#1103' '#1086#1073#1083#1072#1089#1090#1100' '#1087#1077#1088#1077#1087#1086#1083#1085#1077#1085#1080#1103
        #1054#1090#1082#1088#1099#1090#1072#1103' '#1072#1076#1088#1077#1089#1072#1094#1080#1103)
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
    end
    object DensityChoice: TRadioGroup
      Left = 420
      Top = 120
      Width = 180
      Height = 290
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103':'
      Color = clHighlight
      ItemIndex = 0
      Items.Strings = (
        '40% (480 '#1079#1072#1087#1080#1089#1077#1081')'
        '50% (600 '#1079#1072#1087#1080#1089#1077#1081')'
        '60% (720 '#1079#1072#1087#1080#1089#1077#1081')'
        '70% (840 '#1079#1072#1087#1080#1089#1077#1081')'
        '80% (960 '#1079#1072#1087#1080#1089#1077#1081')')
      ParentBackground = False
      ParentColor = False
      TabOrder = 3
    end
    object BucketSizeChoice: TRadioGroup
      Left = 640
      Top = 120
      Width = 180
      Height = 290
      Caption = #1063#1080#1089#1083#1086' '#1087#1072#1082#1077#1090#1086#1074
      Color = clHighlight
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '20'
        '40'
        '60'
        '80'
        '100'
        '120'
        '140'
        '160'
        '180'
        '200')
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
    end
    object HashFunctionChoice: TRadioGroup
      Left = 30
      Top = 270
      Width = 350
      Height = 140
      Caption = #1061#1077#1096'-'#1092#1091#1085#1082#1094#1080#1103
      Color = clHighlight
      ItemIndex = 0
      Items.Strings = (
        #1052#1077#1090#1086#1076' '#1089#1088#1077#1076#1085#1080#1093' '#1082#1074#1072#1076#1088#1072#1090#1086#1074
        #1052#1077#1090#1086#1076' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103' '#1089#1080#1089#1090#1077#1084' '#1089#1095#1080#1089#1083#1077#1085#1080#1103
        #1052#1077#1090#1086#1076' '#1076#1077#1083#1077#1085#1080#1103)
      ParentBackground = False
      ParentColor = False
      TabOrder = 5
    end
    object Panel1: TPanel
      Left = 30
      Top = 480
      Width = 500
      Height = 40
      BevelOuter = bvNone
      TabOrder = 6
    end
  end
end
