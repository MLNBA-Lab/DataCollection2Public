# Excel 转 Latex ，数据最大值加粗

##### 1. Excel 显示开发工具

https://support.microsoft.com/zh-cn/topic/%E6%98%BE%E7%A4%BA-%E5%BC%80%E5%8F%91%E5%B7%A5%E5%85%B7-%E9%80%89%E9%A1%B9%E5%8D%A1-e1192344-5e56-4d45-931b-e5fd9bea2d45

​		默认情况下 **不显示** "开发工具"选项卡，但您可以将其添加到功能区。

1. 在"**文件"**选项卡上，**转到"自定义**>**选项"。**

2. 在“**自定义功能区**”和“**主选项卡**”下，选中“**开发工具**”复选框。

   显示选项卡后，"开发工具"选项卡将保持可见，除非清除该复选框或必须重新安装Microsoft Office程序。

   " **开发** 工具"选项卡是执行下列操作或使用以下功能时可转到的位置：

   

   

##### 2. Excel下 Alt+F11 打开VBA > 左侧树中找Microsoft Excel对象 > 鼠标右键菜单 > 导入文件 > 选硬盘上的.bas文件 > 打开 即可.

##### 3. 开发工具> 宏 >选择test > 执行

##### 4. 在弹出的4个对话框中  依次输入行号，列好， 比如第2行到第5行，B列到I列，依次输入2，5， B，I

##### 5. 这样每一行最大值即可自动加粗





#### 最后，直接拖动Excel2Latex 到excel，即可在加载项中使用宏









以下是加粗模块代码，我是先录制的宏，再修改的代码，供感兴趣的同学进一步完善：

```vb
Sub test()
'
' test 宏
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

```

