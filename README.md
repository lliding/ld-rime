关于本方案的更多介绍请查看 [Rime 输入法方案描述](https://lishouzhong.com/article/note/uncategoried/Rime%20%E8%BE%93%E5%85%A5%E6%B3%95%E6%96%B9%E6%A1%88%E6%8F%8F%E8%BF%B0/) 。

**由于五笔 86 方案中包含私有码表 (Win10 1809 内置的 86 五笔码表)，故此配置仅用于个人学习与交流。**

## 配置说明

所有方案默认不开启用户造词词库功能，有需要的用户需请自行开启。

## 五笔方案

五笔输入法使用 86 版，词库主体采用大单字库 + 小词库的方案。

Rime 官方的 86 五笔词库 [rime-wubi](https://github.com/rime/rime-wubi) 来源于 [acevery/ibus-table-wubi](https://github.com/acevery/ibus-table-wubi/blob/master/tables/wubi86.txt) 项目 ，但由于上游词库的码表里有很多错误的编码，直到 2015 年才被 Rime 用户发现并被 Rime 官方修复，[详情见此](https://github.com/rime/brise/issues/90#issuecomment-110983278)。针对错误编码的补丁只存在于 Rime 官方的 rime-wubi 词库中，没有被反馈给上游的 ibus-table-wubi。这个词库错误较多，缺少维护，故不考虑使用。

另一个没有版权问题的词库是窝子 (Wozy) 创建的极爽词库，窝子在 2020 年将极爽五笔词库授权给了 Rime 官方使用，[详情见此](https://github.com/rime/rime-wubi/pull/3#issuecomment-577035306)。但是极爽词库已经很久没有维护过了，因此极爽词库中的码表所包含的汉字也并不全面，只有 11589 个，在输入古汉语时经常找不到字。

目前可以找到的比较完整的码表是 Windows 10 操作系统自带的微软五笔的码表，共计 31900 个字。微软（中国）有限公司也是 [GB 18030-2022](https://std.samr.gov.cn/gb/search/gbDetailed?id=E4A2A4C875726A5DE05397BE0A0A61E8) 的起草单位，自家产品应该会遵循自家标准。所以本方案的五笔方案部分将使用此码表。

但微软五笔码表一共有 534114 个词条，去除单字后还有 502214 个词条，不符合小词库的要求。又考虑到，虽然极爽词库收录的单字并不全面，但它的常用词词库已经非常成熟，所以把极爽词库中的单字部分去除保留词组部分可以直接得到一个小体积的词库。

所以最终词库码表的组成是: 微软五笔的单字码表 + 极爽词库的多字词码表。

有两个可以选择的词库，一个是让极点五笔成名的极爽 4.3 词库，另一个是从极爽 4.3 改进来的极爽 6.0 词库。考虑到极爽 4.3 比 6.0 出名得多，所以决定使用极爽 4.3 作为小词库的来源。极爽 4.3 词库中共有 88543 个词条，其中包含 61432 个词组，符合小词库的要求。

最终，五笔方案的词库构成为:

- 词库主体:
  - 微软五笔词库的单字码表
  - 极爽 4.3 词库的多字词码表
- 其他词库:
  - [KyleBing/rime-wubi86-jidian](https://github.com/KyleBing/rime-wubi86-jidian) 中取行政区划词库码表
  - 用户私有词库码表

## 拼音方案

本方案的拼音输入法使用双拼 (自然码) 和全拼两种方案，可以自行切换。

双拼输入法在解析时会被映射到全拼上面，所以双拼输入法没有自己的词库。

最终，全拼词库的构成为:

- 词库主体:
  - Rime 官方的袖珍简化字 [rime-pinyin-simp](https://github.com/rime/rime-pinyin-simp) 方案的词库 (上游词库为安卓开源项目)
  - 维基百科中文词条库 <https://github.com/felixonmars/fcitx5-pinyin-zhwiki>
- 其他词库:
  - 用户私有词库

## 其他方案

英文输入法来源于 easy_en 项目，作者为 [Patricivs](https://github.com/Patricivs)。

笔画输入法来源于 Rime 官方的 [rime-stroke](https://github.com/rime/rime-stroke) 方案，主要用于反查。

中文数字输入法根据 Rime 官方教程 *数字之道* 修改而来。
