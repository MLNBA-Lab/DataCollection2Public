Attribute VB_Name = "Ä£¿é2"
Sub test()
Attribute test.VB_ProcData.VB_Invoke_Func = " \n14"
'
' test ºê
'

'
Dim row1, row2, col1, col2

row1 = InputBox("Please input first row numbel:")
row2 = InputBox("Please input last row numbel:")

col1 = InputBox("Please input first col numbel:")
col2 = InputBox("Please input last col numbel:")

For i = row1 To row2

    Range(col1 & i & ":" & col2 & i).Select
    Selection.FormatConditions.AddTop10
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    With Selection.FormatConditions(1)
        .TopBottom = xlTop10Top
        .Rank = 1
        .Percent = False
    End With
    With Selection.FormatConditions(1).Font
        .Bold = True
        .Italic = False
        .TintAndShade = 0
    End With
    Selection.FormatConditions(1).StopIfTrue = False
    

Next

End Sub
