# 天河学院本科毕业论文LaTeX模板(理工科)

[帮助页面](https://thxy-gu.github.io/)

无可否认，Word 是一款很成功的办公软件，可是不同应用版本存在各种差异，实现毕业论文排版要求的难度还是存在的。如果要真正学会 Word，能实现类似自动编号、交叉引用、奇偶页对称、分节页码等等要求，还是要付出一定的时间代价。如果能有一种方式，像写代码一样控制文档，实现对每一个元素都能进行定制化，那才是一个理工科该有的写论文的样子。

所幸的是，我们还有 LaTeX。LaTeX 是由著名计算机科学家 Lamport（分布式系统领域泰斗）在业余时间基于目前世界上最德高望重的计算机科学家Knuth（高德纳，计算机科学家教父级人物）开发的 TeX 排版系统修改并简化而来。TeX 这套排版系统如今已经是学术界公认的排版工具之一，深受计算机科学、物理学、数学、生物学等理工领域的学者所喜爱。国内不少一流的大学也提供毕业论文的LaTeX模板（当然，也有不少是非官方提供的），但天院还没有。

LaTeX 非常强大，学会它你可以轻松地排版出令人惊艳的著作。不过，这不是我能教会给你的。**坦率地讲，LaTeX 的学习曲线非常陡峭** ，它没有 Word 那样可视化页面，甚至有时候你还可能因为符号的差错还需要去调试。如果你要从0开始学习 LaTeX，然后独立排版出学校毕业论文，我建议还是学习 Word 吧。但是，有了模板，你所需需要的，只是模仿一下例子，就可以排版出符合学校要求的学校毕业论文，因为学校的格式要求在模板中已经解决了，大部分操作只需要复制粘贴上文本就可以了。唯一有难度的，大概就是插入图片和表格吧。


```
.
├── README.md
├── main.pdf        # 最终效果
├── main.tex        # 示例模板
├── static          # 静态资源，如图片
└── thxythesis.cls  # 样式
```


## 运行环境

- 要使用这个模板，需要先安装 TeX 环境，推荐安装 [TeXLive](https://www.tug.org/texlive/)（支持OS X、Linux、Windows）；
- 如果不想折腾，可以直接使用 [Tex Studio](https://www.texstudio.org/) 进行文档的编写；
- 如果是计算机学院的学生，我建议可以学习一下如何配置 Visual Studio Code 环境或者 Sublime Text环境，具体操作建议向搜索引擎求助。


## 使用方法

建议在示例的 [main.tex](/main.tex) 文件中进行修改；`\begin{document}` 开始是正式的论文内容；`\makecoverandfaith` 用于载入封面和诚信声明，如果需要生成没有封面和诚信声明的论文，只需要在最前面加上 `%`，或者删掉该行即可（不推荐）。

按照 main.tex 的内容简单的替换一下即可：

1. 论文基础信息

将 `{}` 中信息替换成对应的论文信息即可；

```tex
% 中文题目
\title{多功能温湿度数字显示及控制系统的研制}
% 英文题目
\englishtitle{On the Research and Development of Multi-function Temperature - Humidity Monitor and Display System}
% 二级学院
\institute{}
% 专业
\major{计算机科学与技术}
% 姓名
\authorname{张\quad 三}
% 学号
\studentid{**************}
% 指导教师
\teachername{李\quad 四}
% 年月
\thesisdate{2019}{5}
```

2. 中文摘要环境

```tex
% 中文摘要内容
\begin{Abstract}
本设计系统地设计了集温度与湿度采集、控制范围设置、声光报警、环境温湿度调节及液晶显示等多功能的实时控制系统。经过多次运行与检测，实践证明该电路工作稳定，显示清晰。本设计思路明晰，可拓展空间大。其可广泛\upcite{1}适用于与人民日常生活、工农业生产有关的温湿度测量以及加热制冷设备控制。

\keywords{温度；湿度；单片机；液晶显示屏}
\end{Abstract}
```

3. 英文摘要环境

```tex
% 英文摘要内容
\begin{Abstract}[e]
The design is a multi-function real time monitor system which integrates functions like collecting temperature and humidity data, setting the limited digit scope, sound-light siren, as well as moderating the environmental temperature and humidity. Withstanding numerous trials and examinations, the circuit proves to be able to operate stably with a clear display. The idea of this design  is easy to understand and has great respect to develop. And it can be widely used in daily life and industry to measure the temperature and humidity as well as controlling the heating and cooling device.

\keywords[e]{emperature; Humidity; Monolithic Integrated Circuit}
\end{Abstract}
```

4. 目录

学校要求目录不要出现页眉页脚，目前仅提供两页目录的支持，三页或更多页的目录可能会有问题（不过，毕业论文目录不会超过两页吧）。
```tex
\contents
```

5. 章节层次

其实我个人推荐到第三层就行了，不要到第四层。至于第五层已经和正文字体一致，就没有额外提供定制了。

```tex
% 第一层
\chapter{总体方案论述}
% 第二层
\section{总体功能及性能指标}
% 第三层
\subsection{总体功能}
% 第四层
\subsubsection{温度和湿度采集}
```

6. 参考文献

在文中插入引用时可以使用 `\upcite{}`，`\bibitem{x}` 中不一定要用数字，也可以用其它有意义的名字进行命名。

```tex
% 参考文献
\begin{Reference}
\bibitem{1}金伟正编著.单线数字温度传感器的原理及应用[M].2000.6.
\bibitem{2}刘文涛.单片机语言C51典型应用设计[M].北京：人民邮电出版社，2005.
\bibitem{3}赵文博，刘文涛.单片机语言C51程序设计[M].北京：人民邮电出版社，2005.
\bibitem{4}李维缇，郭强编著.液晶显示应用技术[M].北京：电子工业出版社，2001.
\end{Reference}
```


7. 致谢
```tex
% 致谢
\begin{Thanks}
本论文（设计）是在我的指导教师XXX副教授的亲切关怀和悉心指导下完成的。他严肃的科学态度，严谨的治学精神，精益求精的工作作风，深深地感染和激励着我。从题目的选择到最终完成，XXX老师都始终给予我细心的指导和不懈的支持。
\end{Thanks}
```

8. 附录
```
% 附录
\begin{Appendix}
\chapter{核心程序代码}
\end{Appendix}
```

更多模板使用指南，请移步：[https://thxy-gu.github.io/](https://thxy-gu.github.io/)


## 更新说明

|版本|发行日期|介绍|
|---|---|---|
|v1.0|2020.2.2|万物皆有裂痕，那是光进来的地方|
|v1.0.1|2020.2.5|主要修复 subsubsection的bug|
|v1.1|2020.3.14|新增定制代码环境|
|v1.1.2|2020.3.16|对两页的目录样式提供支持，简化正文设置|
|v1.1.3|2020.3.22|将“诚信说明”部分的字体换成“仿宋”，提高兼容性|
|v1.1.4|2020.3.22|超链接不显示彩色边框|
|v1.2.0|2020.4.22|增加对float包的支持，修复附录图表样式|
|v1.2.1|2020.4.27|调整章节标题的空白|

未来版本更新：简化样式文件，进行细微调整，定制公式环境等等；

## 致谢

- 感谢计算机科学与工程学院何韦颖老师对我开发工作的支持和肯定；

- 感谢电气与电子工程学院16级通信1班的同学，他们不少人对我予以的高度的信任，提出了模板的部分意见，还提供了少量的资金支持，让有我动力的继续干下去。

- 感谢16计科3班的同学，还有天软科技工作室的小伙伴们给予我的支持和关心。

## License
遵循[BSD 3-Clause License](./LICENSE) 协议
