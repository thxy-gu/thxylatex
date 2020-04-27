\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thxythesis}[2020/03/14 v1.2.1 广东技术师范大学天河学院本科毕业论文模板]

% 便于引用标题
\renewcommand\title[1]{\def\@thxy@string@title{#1}}

\newcommand*\thxy@string@english{}         % 英语标题
\newcommand*\thxy@string@english@ul{}      % 英语标题(带下划线)
\newcommand*\thxy@string@institute{}       % 学院名称
\newcommand*\thxy@string@major{}           % 专业
\newcommand*\thxy@string@author{}          % 姓名
\newcommand*\thxy@string@id{}              % 学号
\newcommand*\thxy@string@teacher{}         % 指导老师
\newcommand*\thxy@value@year{}             % 年 <- 日期
\newcommand*\thxy@value@month{}            % 月 <- 日期


% a4纸，小四，奇偶分区选用 book 文类，openany使得章节前面不留白
\LoadClass[a4paper, cs4size, fancyhdr, openany]{ctexbook}

%% ----  导入必要的宏包  ----
% 版面与版式设计宏包
\RequirePackage{geometry, fancyhdr}
% 图片宏包
\RequirePackage{graphicx}
% 表格
\RequirePackage{array}
% 设置颜色
\RequirePackage{xcolor}
% 调整行间距
\RequirePackage{setspace}
% 条件判断（便于编写模板）
\RequirePackage{ifthen}
% 标题格式
\RequirePackage{titlesec, titletoc}
% 首段缩进
\RequirePackage{indentfirst}
% 超链接
\RequirePackage{hyperref}
% 附录
\RequirePackage{appendix}
% 子图标题
\RequirePackage[labelformat=simple]{subcaption}
% 智能自动化交叉引用
\RequirePackage{cleveref}
% 文献引用
\RequirePackage{cite}
% 空白页不要页眉页脚
\RequirePackage{emptypage}
% 代码环境
\RequirePackage{listings}
% 浮动环境
\RequirePackage{float}

% 去掉引用的颜色方框
\hypersetup{hidelinks}
% 覆盖默认的 book 设定
\pagestyle{fancy}
% a4纸，上边距：28mm；下边距：22mm；左边距：30mm；右边距：20mm；
\geometry{a4paper,top=28mm,bottom=22mm,left=30mm,right=20mm}

% 页眉、页脚
\fancyhf{} % 清除默认页眉和页脚
% 不然有警告；Package Fancyhdr Warning: \headheight is too small...
\setlength{\headheight}{12.65pt}

% 页眉：偶数页(左页)，居中宋体5号
\fancyhead[EC]{\songti\zihao{5}{广东技术师范大学天河学院本科毕业论文（设计）}}
% 页眉：奇数页(右页)，论文标题，居中宋体5号
\fancyhead[OC]{\songti\zihao{5}{\@thxy@string@title}}
% 页脚：页码
\fancyfoot[EL,OR]{\thepage}

% 字体设置
% 每行缩进两个汉字
\setlength\parindent{2em}
% 设置字体
\setmainfont{Times New Roman}
%\setmonofont{Courier New}
\setsansfont{Arial}

% 黑体
\setCJKfamilyfont{hei}[AutoFakeBold]{STHeiti-Regular}
\newcommand*{\hei}{\CJKfamily{hei}}
% 仿宋(诚信声明正文)
\setCJKfamilyfont{fangsong}[AutoFakeBold]{FangSong}
\newcommand*{\fang}{\CJKfamily{fangsong}}
% 楷体
\setCJKfamilyfont{kai}[AutoFakeBold]{STKaitiSC-Regular}
\newcommand*{\kai}{\CJKfamily{kai}}
% 宋体
\setCJKfamilyfont{song}[AutoFakeBold]{STSongti-SC-Regular}
\newcommand*{\song}{\CJKfamily{song}}

%% PART1 \maketitle
% 1.论文封面
% logo部分
% 2.诚信声明

% 封面和诚信声明
\newcommand{\makecoverandfaith}[1]{
\begin{titlepage}
\thispagestyle{empty} % 无需页眉页脚
% logo和校名并列
\begin{figure}[!h]
    \begin{minipage}{0.2\linewidth}\centering
        \includegraphics[scale=0.08]{static/logo.jpg}
    \end{minipage}
    \begin{minipage}{0.8\linewidth}
        \includegraphics[scale=0.4]{static/name.png}\\
        \includegraphics[scale=0.4]{static/name-en.png}
    \end{minipage}
\end{figure}

\vspace{20mm} % 垂直空白，控制 logo 与文字间空白距离
% 小初居中
\centerline{\hei\zihao{-0}毕 业 论 文（设 计）}
\vspace{30mm}

\makebox[2cm][r]{\song\zihao{3}{题名：}}
\makebox[10cm][l]{\song\zihao{3}\uline{\hfill \@thxy@string@title \hfill}}
\par \vspace{15pt} % 行间距
\makebox[2cm][r]{\song\zihao{4}{（英文）：}}
\parbox[t]{10cm}{\zihao{3}\thxy@string@english@ul}
\par \vspace{30mm}

\makebox[4cm][r]{\song\zihao{3}{二级学院：}}\makebox[8cm][l]{\song\zihao{3}\uline{\hfill \thxy@string@institute \hfill}}
\par \vspace{15pt}
\makebox[4cm][r]{\song\zihao{3}{专\qquad 业：}}\makebox[8cm][l]{\song\zihao{3}\uline{\hfill \thxy@string@major \hfill}}
\par \vspace{15pt}
\makebox[4cm][r]{\song\zihao{3}{姓\qquad 名：}}\makebox[8cm][l]{\song\zihao{3}\uline{\hfill \thxy@string@author \hfill}}
\par \vspace{15pt}
\makebox[4cm][r]{\song\zihao{3}{学\qquad 号：}}\makebox[8cm][l]{\song\zihao{3}\uline{\hfill \thxy@string@id \hfill}}
\par \vspace{15pt}
\makebox[4cm][r]{\song\zihao{3}{指导教师：}}\makebox[8cm][l]{\song\zihao{3}\uline{\hfill \thxy@string@teacher \hfill}}
\par \vspace{15pt}
\makebox[4cm][r]{\song\zihao{3}{日\qquad 期：}}\makebox[8cm][l]{\song\zihao{3}\uline{\hfill \thxy@value@year 年\thxy@value@month 月 \hfill}}
\end{titlepage}
\newpage
\thispagestyle{empty} % 无需页眉页脚

% 宋体、小二、加粗、居中
\centerline{\song\zihao{-2}\bfseries{诚\quad 信\quad 声\quad 明}}

\vspace{15mm}

\begin{spacing}{2.0}
\fang\zihao{-3}
本人声明：\par
1、本人所呈交的毕业设计（论文）是在老师指导下进行的研究工作及取得的研究成果；\par
2、据查证，除了文中特别加以标注和致谢的地方外，毕业设计（论文）中不包含其他人已经公开发表过的研究成果，也不包含为获得其他教育机构的学位而使用过的材料；\par
3、我承诺，本人提交的毕业设计（论文）中的所有内容均真实、可信。\par
\end{spacing}

\vspace{35mm}

\fang\zihao{-3}{作者签名：}\makebox[6cm] \fang\zihao{-3}{日期：\quad 年\quad 月\quad 日}
}

%% PART2 正文部分
% 3.中/英文摘要
\newenvironment{Abstract}[1][c]{
\newpage
\thispagestyle{empty}
\ifthenelse{\equal{#1}{e}}
{
\begin{center}
\bfseries{\zihao{2} \thxy@string@english}
\par \vspace{10mm}
% 三号加粗
\zihao{3}\textbf{ABSTRACT}
\end{center}
\begin{spacing}{1.5}
\zihao{-4}
}{
\begin{center}
    \vspace{10mm}
    \hei\zihao{2}{\bfseries \@thxy@string@title}
    \par \vspace{10mm}
    % 三号黑体加粗
    \hei\zihao{3}{\bfseries 摘要}
\end{center}
\vspace{6mm} % 空一行
\begin{spacing}{1.5}
   \song\zihao{-4}
}
}{\end{spacing}}


\newcommand{\keywords}[2][c]
{
\vspace{10mm} 
% “关键词
\ifthenelse{\equal{#1}{e}}
{\zihao{4}{\bfseries Key words:} \zihao{-4}{#2}}
{\hei\zihao{4}{\bfseries 关键词：} \song\zihao{-4}{#2}}
}

% 5.目录
%% 默认的第x章 改成阿拉伯数字（学校这非主流格式，我也是醉了）
\CTEXsetup[name={}, number={\arabic{chapter}}, nameformat+={\bfseries\hei\zihao{3}}]{chapter}
% 目录两个字居中
\renewcommand{\contentsname}{\centerline{\hei\zihao{3}\bfseries 目录}}
\titlecontents{chapter}[0pt]{\hei\zihao{-4}}{\thecontentslabel}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{section}[1em]{\song\zihao{-4}}{\thecontentslabel}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{subsection}[2em]{\song\zihao{-4}}{\thecontentslabel}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}

\newcommand{\contents}{
  % 目录页(当前页）不显示页码
  \addtocontents{toc}{\protect\thispagestyle{empty}}
  \tableofcontents
  \thispagestyle{empty}
  \newpage
  % \pagestyle{fancy}
  % 正文宋体小四
  \setcounter{page}{1}
  \song\zihao{-4}
}

% -- 正文部分 ---
%% 编号到第四层
%% 有点后悔自定义chapter了，如果自定义section，就不会遇到同样的麻烦？？
\setcounter{secnumdepth}{4}

%% 这一次，我们重新定义了chapter，并在最后保留了fancy格式
\titleformat{\chapter}
  {\hei\zihao{3}\bfseries}{\thechapter .}{1em}{\zihao{3}}[\thispagestyle{fancy}]
\titlespacing*{\chapter}{0pt}{-10pt}{5pt}
\titleformat*{\section}{\zihao{-3}\bfseries\hei}
\titleformat*{\subsection}{\zihao{4}\bfseries\hei}
\titleformat*{\subsubsection}{\zihao{-4}\bfseries\hei}
\renewcommand\thesubsubsection{\qquad\arabic{subsubsection} 、}

%%% 我坦白，下面几行是我抄的，其实我也不太清楚他说的是什么，但感觉他说得很对。
% 浮动环境设置
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
 \renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
 \renewcommand*{\topfraction}{0.9}
 \renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
 \renewcommand*{\floatpagefraction}{0.85}


 %% 图表、章节编号处理...
% 图表标题
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{five}{\zihao{5}}
\captionsetup[figure]{%
    format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
    labelsep=quad, % 分隔符是一个空格
    font={song,five}, % 图的字体, 宋体五号
    position=bottom % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}

\captionsetup[table]{%
    format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
    labelsep=quad, % 分隔符是一个空格
    font={song,five,bf}, % 表的字体, 宋体五号
    position=top % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}

\renewcommand\thesubfigure{（\alph{subfigure}）}
% 注
\newcommand\note[1]{\song\zihao{-5} 注：#1}


% 表格是五号宋体，封装一个环境吧
\newenvironment{Table}[1][!h]{
\begin{table}[#1]
\song\zihao{5}
}{\end{table}}

% 参考文献
\newenvironment{Reference}{
\titleformat{\chapter}
  {\centering\hei\zihao{3}\bfseries}{\thechapter}{1em}{\zihao{3}}[\thispagestyle{fancy}]
\begin{spacing}{1.5}
\begin{thebibliography}{99}
\addcontentsline{toc}{chapter}{参考文献}
\vspace{1.5em} % 空一行
\labelsep=0em % 序号后不能有空格
}{\end{thebibliography}
% 减少副作用，改回去
\titleformat{\chapter}
  {\hei\zihao{3}\bfseries}{\thechapter .}{1em}{\zihao{3}}[\thispagestyle{fancy}]
\end{spacing}}

% 文献上标引用
\newcommand{\upcite}[1]{\textsuperscript{\song\zihao{-4} \cite{#1}}}

% 致谢
\newenvironment{Thanks}{
\chapter*{\centerline{致谢}}
\vspace{5pt}
\addcontentsline{toc}{chapter}{致谢}
\thispagestyle{fancy}
\begin{spacing}{1.5}
\song\zihao{-4}
}{\end{spacing}}

% 附录
\newenvironment{Appendix}{
\appendix
%% 看到这里，我总是怀疑定义chapter到底必要吗？
\renewcommand{\thechapter}{附录~\Alph{chapter}}
%% 图片和表格的题注
\renewcommand{\thetable}{\Alph{chapter}\arabic{table}}
\renewcommand{\thefigure}{\Alph{chapter}\arabic{figure}}

\titleformat{\chapter}
  {\centering\hei\zihao{3}\bfseries}{\thechapter}{1em}{\zihao{3}}[\thispagestyle{fancy}]
}{
% 减少副作用，改回去
\titleformat{\chapter}
  {\hei\zihao{3}\bfseries}{\thechapter .}{1em}{\zihao{3}}[\thispagestyle{fancy}]
}


% 代码环境定制
% https://www.overleaf.com/learn/latex/Code_listing

% 定制代码配色
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
}

% 定制JavaScript的方案
\lstdefinelanguage{JavaScript}{
  keywords={typeof, new, true, false, catch, function, return, null, catch, switch, var, if, in, while, do, else, case, break, class, export, boolean, throw, implements, import, this},
  identifierstyle=\color{black},
  sensitive=false,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]',
  morestring=[b]"
}

\lstset{style=mystyle}

%% ---- 变量聚集地 ----
\newcommand*\englishtitle[1]{
    \renewcommand{\thxy@string@english@ul}{\uline{#1}}
    \renewcommand{\thxy@string@english}{#1}
}
\newcommand*\institute[1]{
    \renewcommand{\thxy@string@institute}{#1}}
\newcommand*\major[1]{
    \renewcommand{\thxy@string@major}{#1}}
\newcommand*\authorname[1]{
    \renewcommand{\thxy@string@author}{#1}}
\newcommand*\studentid[1]{
    \renewcommand{\thxy@string@id}{#1}}
\newcommand*\teachername[1]{
    \renewcommand{\thxy@string@teacher}{#1}}
\newcommand*\thesisdate[2]{
    \renewcommand{\thxy@value@year}{#1}
    \renewcommand{\thxy@value@month}{#2}
}

% 总有结束的那一天...
\endinput
