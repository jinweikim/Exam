USE [master]
GO
/****** Object:  Database [Exam]    Script Date: 2018/7/15 14:58:38 ******/
CREATE DATABASE [Exam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Exam', FILENAME = N'E:\SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Exam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Exam_log', FILENAME = N'E:\SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Exam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Exam] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Exam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Exam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Exam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Exam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Exam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Exam] SET ARITHABORT OFF 
GO
ALTER DATABASE [Exam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Exam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Exam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Exam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Exam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Exam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Exam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Exam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Exam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Exam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Exam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Exam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Exam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Exam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Exam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Exam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Exam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Exam] SET RECOVERY FULL 
GO
ALTER DATABASE [Exam] SET  MULTI_USER 
GO
ALTER DATABASE [Exam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Exam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Exam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Exam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Exam] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Exam', N'ON'
GO
ALTER DATABASE [Exam] SET QUERY_STORE = OFF
GO
USE [Exam]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Exam]
GO
/****** Object:  Table [dbo].[Paper]    Script Date: 2018/7/15 14:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paper](
	[paper_id] [int] IDENTITY(1,1) NOT NULL,
	[que_id] [int] NULL,
	[paper_group] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[paper_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2018/7/15 14:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[que_id] [int] IDENTITY(1,1) NOT NULL,
	[que_head] [nvarchar](500) NULL,
	[que_ans] [nvarchar](100) NULL,
	[que_type] [nvarchar](10) NULL,
	[que_opt_a] [nvarchar](100) NULL,
	[que_opt_b] [nvarchar](100) NULL,
	[que_opt_c] [nvarchar](100) NULL,
	[que_opt_d] [nvarchar](100) NULL,
	[que_opt_e] [nvarchar](100) NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[que_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 2018/7/15 14:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[test_id] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2018/7/15 14:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [nchar](10) NOT NULL,
	[user_name] [nchar](10) NULL,
	[user_password] [nchar](10) NULL,
	[user_grade] [int] NULL,
	[user_class] [nchar](10) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2018/7/15 14:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[user_id] [nchar](10) NOT NULL,
	[user_name] [nchar](10) NULL,
	[user_password] [nchar](10) NULL,
	[user_grade] [int] NULL,
	[user_class] [nchar](10) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Paper] ON 

INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1443, 116, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1444, 92, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1445, 53, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1446, 87, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1447, 39, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1448, 34, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1449, 90, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1450, 121, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1451, 95, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1452, 76, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1453, 187, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1454, 171, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1455, 181, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1456, 188, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1457, 175, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1458, 204, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1459, 203, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1460, 168, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1461, 16, 1)
INSERT [dbo].[Paper] ([paper_id], [que_id], [paper_group]) VALUES (1462, 129, 1)
SET IDENTITY_INSERT [dbo].[Paper] OFF
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (2, N'Pentium微机的字长是（）                                                                                     ', N'C                                                                                                   ', N'opt', N'8位 的                                                                                               ', N'16位                                                                                                 ', N'32位                                                                                                 ', N'64位                                                                                                 ', N'128位')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (3, N'一个字长为5位的无符号二进制数能表示的十进制数值范围是（）                                                                       ', N'B                                                                                                   ', N'opt       ', N'1~32                                                                                                ', N'0~31                                                                                                ', N'1~31                                                                                                ', N'0~32                                                                                                ', NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (4, N'1946年首台电子数字计算机ENIAC问世后，冯.诺依曼在研制EDVAC计算机时，提出两个改进，他们是', N'C                                                                                                   ', N'opt', N'引进CPU和存储程序控制的概念                                                                                     ', N'采用机器语言和十六进制                                                                                         ', N'采用二进制和存储程序控制的概念                                                                                     ', N'采用ASCII编码系统                                                                                         ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (5, N'假设某台式计算机的内存储器容量为128M，硬盘容量为10G.硬盘的容量是内存容量的（）', N'C                                                                                                   ', N'opt', N'40倍                                                                                                 ', N'60背                                                                                                 ', N'80倍                                                                                                 ', N'100倍                                                                                                ', N'120倍')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (7, N'典型的以太网交换机允许一部分端口支持10BASE-T,另一部分端口支持100BASE-T.在采用____技术时，交换机端口可以同时支持10Mbps/100Mbps。', N'自动侦测', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (8, N'网络操作系统的发展经历了从对等结构向____结构演变的过程。', N'非对等                                                                                                 ', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (9, N'网络管理的目标是最大限度地增加网络的可用时间，提高网络设备的利用率，改善网络性能、服务质量和____。', N'安全性                                                                                                 ', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (10, N'OSI参考模型是个开放的模型，它的一个很重要的特点就是具有分层结构，其中____层具有的功能是规范数据表示方式个规定数据格式等', N'表示                                                                                                  ', N'blank     ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (13, N'汇编语言是一种（    ）', N'A', N'opt', N'依赖于计算机的低级程序设计语言', N'计算机能直接执行的程序设计语言', N'独立于计算机的高级程序设计语言', N'面向问题的程序设计语言', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (15, N'在一个非零无符号二进制整数之后添加一个0，则此数的值为原数的（    ）', N'B', N'opt', N'4倍', N'2倍', N'1/2倍', N'1/4倍', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (16, N'数据链路层使用的信道主要有点对点信道和____两种', N'广播信道', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (17, N'CSMA/CD协议的含义：
', N'载波监听多点接入/碰撞检测', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (18, N'以太网发送的数据都使用____编码', N'曼彻斯特', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (19, N'虚拟局域网VLAN的定义：由一些局域网段构成的与物理位置无关的逻辑组，基于____端口实现。
', N'虚拟交换', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (20, N'应用层的许多协议都是基于____方式
', N'客户-服务器', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (21, N'数据库系统的核心是____。', N'数据库管理系统', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (22, N'在关系模型中，实体以及实体间的联系都是用______来表示的', N'关系', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (23, N'设关系模型R(A，B，C)，F是R上的函数依赖集，F={A→B,C→B}，则R的候选码为_________', N'（A，C）', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (24, N'层次模型用“树结构”来表示数据之间的联系，网状模型用“_________” 来表示数据之间的联系', N'图状结构', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (25, N'SQL Server中，一个简单的数据库可以只有一个_________文件和一个日志文件', N'数据', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (26, N'聚集索引和非聚集索引的存储结构都采用____________索引结构', N'B+树', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (27, N'一个事务必须具有的四个属性是原子性、一致性、__________和持久性。', N'隔离性', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (28, N'在T-SQL中，查询表中数据时，可用___________关键字滤掉重复行', N'DISTINCT', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (29, N'调用标量函数时必须提供至少由两部分组成的名称,即________. 函数名。', N'拥有者', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (30, N'_____触发器是当数据库服务器中发生数据操作语言事件时会自动执行的存储过程。', N'DML', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (33, N'一个学生可以同时借阅多本书，一本书只能由一个学生借阅，学生和图书之间是什么样的联系（ ）', N'B', N'opt', N'一对一 ', N'一对多', N'多对多', N'以上都不是', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (34, N'规定关系的所有主属性都不能取空值，是用来实现哪一类完整性约束(    )', N'A', N'opt', N'实体完整性 ', N'属性值的约束', N'参照完整性 ', N'用户定义完整性', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (35, N'学生关系（学号，姓名，性别，年龄，系号，系名）中，“系名”对主关键字“学号”的函数依赖是(   )', N'C', N'opt', N'完全函数依赖  ', N'部分函数依赖', N'传递函数依赖', N'平凡函数依赖', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (37, N'在一个关系中，所有字段都是不可分的，给定一个关键字，则可以在这个数据表中唯一确定一条记录，则这个关系一定满足1NF、2NF和3NF中的(    )', N'A', N'opt', N'1NF ', N'1NF和2NF ', N'1NF、2NF和3NF  ', N'2NF和3NF', N'3NF')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (38, N'已知三个关系：
S（学号，姓名，性别）;C（课程编号，课程名称，学时）
SC（学号，课程编号，分数）
若要查询所有选了课的学生的学号和姓名，下列语句正确的是（   ）', N'D', N'opt', N'select 学号,姓名 from s WHERE 学号  in  (select * from sc)', N'select 学号,姓名 from s WHERE  in  (select * from sc where s.学号=sc. 学号)', N'select学号,姓名 from s 
WHERE 学号 exists (select * from sc where s.学号=sc. 学号)', N'select学号,姓名 from s 
WHERE exists (select * from sc where s. 学号=sc. 学号)', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (39, N'SQL语句中删除表的命令是(    )', N'C', N'opt', N'DELETE TABLE ', N'DELETE DBF', N'DROP TABLE ', N'DROP DBF', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (40, N'如果课程表Course是使用以下SQL语句创建的：CREATE TABLE Course(Cno CHAR(2) not null, Cname CHAR(20), Cfen INT)；下面的SQL语句中可以正确执行的是(    )', N'D', N'opt', N'INSERT INTO Course(Cno,Cname,Cfen) VALUES (C2,″数据库″,3)', N'INSERT INTO Course(Cno,Cname,Cfen ) VALUES(″C2″,″数据库″, ″2″)', N'INSERT INTO Course(Cname,Cfen )VALUES(″数据库″,3)', N'INSERT INTO Course(Cno,Cname )VALUES(″C2″,″数据库″)', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (44, N'授予user1用户修改st表中的“姓名”字段的权限，应使用的SQL语句是(  )', N'B', N'opt', N'GRANT UPDATE(姓名) ON st TABLE TO user1', N'GRANT UPDATE(姓名) ON TABLE st TO user1', N'GRANT MODIFY(姓名) ON st TABLE TO user1', N'GRANT MODIFY(姓名) ON TABLE st TO user1', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (45, N'显式事务和隐式事务都需要用什么语句来提交和回滚（   ）?', N'B', N'opt', N'END TRANSACTION和ROLLBACK TRANSACTION', N'COMMIT TRANSACTION和ROLLBACK TRANSACTION', N'SAVE TRANSACTION和ROLLUP TRANSACTION ', N'COMMIT TRANSACTION和ROLLUP TRANSACTION', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (46, N'下列哪种情况不适合创建索引（    ）', N'C', N'opt', N'表中的主键列 ', N'只有两个或若干个值的列', N'需要强制实施唯一性的列 ', N'连接中频繁使用的列', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (47, N'微机的微处理器芯片上集成有______。', N'B', N'opt', N'控制器和存储器', N'控制器和运算器', N'CPU和存储器', N'运算器和I/O接口', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (48, N'在微型机中CPU对以下几个部件访问速度最快的是_____。', N'C', N'opt', N'硬盘', N'软盘', N'RAM', N'ROM', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (49, N'一个完整的计算机系统包括____。', N'D', N'opt', N'主机、键盘、显示器', N'计算机及其外部设备', N'系统软件与应用软件', N'计算机的硬件系统和软件系统', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (50, N'微型计算机的运算器、控制器及内存储器的总称是____。', N'D', N'opt', N'CPU', N'ALU', N'MPU', N'主机', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (51, N'“长城386微机”中的“386”指的是____。', N'A', N'opt', N'CPU的型号', N'CPU的速度', N'内存的容量', N'运算器的速度', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (52, N'.在微型计算机中,微处理器的主要功能是进行____。', N'A', N'opt', N'算术逻辑运算及全机的控制', N'逻辑运算', N'算术逻辑运算', N'算术运算', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (53, N'反映计算机存储容量的基本单位是____。', N'B', N'opt', N'二进制位', N'字节', N'字', N'双字', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (54, N'.在微机中,应用最普遍的字符编码是____。', N'A', N'opt', N'ASCII码', N'BCD码', N'汉字编码', N'补码', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (55, N'DRAM存储器的中文含义是____。', N'D', N'opt', N'静态随机存储器', N'动态只读存储器', N'静态只读存储器', N'动态随机存储器', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (56, N'微型计算机的发展是以____的发展为表征的。', N'A', N'opt', N'微处理器', N'软件', N'主机', N'控制器', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (57, N'世界上公认的第一台电子计算机诞生在____。', N'B', N'opt', N'1945年', N'1946年', N'1948年', N'1952年', N'1953年')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (58, N'通常,在微机中所指的80486是____。', N'D', N'opt', N'微机名称', N'微处理器型号', N'产品型号', N'主频', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (59, N'某同学浏览网页时，当鼠标移动到某处时，发现鼠标指针变成“小手”形状时，说明该位置有（     ）    ', N'B', N'opt', N'病毒', N'超链接', N'黑客入侵 ', N'错误 ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (60, N'计算机存储容量的大小以字节为单位，1KB等于（     ） ', N'B', N'opt', N'1000B   ', N'1024B  ', N'1000×1000B', N'1024×1024B ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (61, N' 下列设备中属于输出设备的是（    ）', N'A ', N'opt', N'打印机 ', N'扫描仪 ', N'数码相机 ', N'键盘 ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (62, N'CPU包括（     ） ', N'A', N'opt', N'控制器和运算器', N'控制器和内存', N'运算器和内存', N'主机和内存 ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (63, N'如果一张光盘的存储容量为650MB，那么这张光盘可以存储（     ）个字节的信息。 ', N'C', N'opt', N'650    ', N'650×1024 ', N'650×1024×1024', N'650×1024×1024×1024', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (64, N'下列硬件设备中，属于计算机的输入设备的是（    ） ', N' D', N'opt', N'中央处理器 ', N'打印机', N'硬盘', N'扫描仪 ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (65, N'下面关于信息的说法中错误的是（    ） ', N'B', N'opt', N'计算机可以处理数值、文字、图形、图像和声音等信息 ', N'信息只能通过计算机处理 ', N'信息处理主要包括原始数据的采集、存储、传输、加工和输出    ', N'计算机是现代信息处理的重要工具 ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (66, N'计算机存储容量的大小一般以（     ）为单位', N'A ', N'opt', N'字节', N'位', N'字', N'字长 ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (67, N'下面的叙述中错误的是（    ） ', N'D', N'opt', N'知识产权是智力劳动成果的所有者拥有的权利   ', N'知识产权受法律保护 ', N'使用盗版光盘是违反知识产权保护法的 ', N'计算机软件是可以复制的，它不属于知识产权保护对象 ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (68, N'下面关于系统软件和应用软件相互关系的叙述中，正确的是（     ）  ', N'A', N'opt', N'应用软件必须在系统软件的支持下才能运行    ', N'系统必须在应用软件的支持下才能运行 ', N'在系统软件和应用软件相互支持下计算机才能运行', N'系统软件和应用软件都可以独立运行，相互没有依赖关系 ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (69, N'“魅力阳光”4个字在计算机中占用（    ）个字节的位置。', N'C ', N'opt', N'3 ', N'6', N'8 ', N'10', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (70, N'关闭计算机的正确顺序是（     ） ', N'A', N'opt', N'先关主机，后关显示器   ', N'先关显示器，后关主机    ', N'两个同时关闭 ', N'以上操作顺序都可以 ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (71, N'在Windows资源管理器中，若要选定多个不连续的文件或文件夹，正确的操作是（    ）     ', N'C', N'opt', N'按住Ctrl键，用鼠标右键逐个选取  ', N'按住Shift键，用鼠标左键逐个选取  ', N'按住Ctrl键，用鼠标左键逐个选取    ', N'按住Shift键，用鼠标右键逐个选取', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (72, N'Windows 中，屏幕显示多个窗口时，活动窗口（     ） ', N'B', N'opt', N'有多个', N'只有一个且始终在最前面     ', N'有一个固定的', N'可能被别的窗口遮住', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (73, N'Windows的窗口和对话框比较，窗口可以移动和改变大小，而对话框（      ）', N'B', N'opt', N'不能移动，也不能改变大小   B、仅可移动，不能改变大小  ', N'仅可移动，不能改变大小  ', N'仅可以改变大小，不能移动  ', N'既能移动，也能改变大小 ', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (74, N'在下列字符中,其ASCII码值最大的一个是____。', N'C', N'opt', N'9', N'Z', N'a', N'X', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (75, N'键盘在计算机中是属于____。', N'C', N'opt', N'输出设备', N'存储设备', N'输入设备', N'控制设备', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (76, N'下列叙述中,正确的一条是____。', N'A', N'opt', N'用高级程序语言编写的程序称为源程序', N'计算机能直接识别并执行用汇编语言编写的程序', N'机器语言编写的程序执行效率最低', N'不同型号的计算机具有相同的机器语言', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (77, N'下列叙述中,错误的一条是____。', N'C', N'opt', N'内存储器一般由ROM和RAM组成', N'RAM中存储的数据一旦断电就全部丢失', N'软盘的存取速度比硬盘的存取速度快', N'存储在ROM中的数据可以永久保存,断电后也不会丢失', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (78, N'根据域名代码规定,域名中的____表示主要网络支持中心网站', N'A', N'opt', N'.net', N'.com', N'.gov', N'.org', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (79, N'计算机主要技术指标通常是指____。', N'B', N'opt', N'所配备的系统软件的优劣', N'CPU的主频和运算速度、字长、存储容量', N'显示器的分辨率、打印机的配置', N'硬盘容量的大小', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (80, N'按操作系统的分类,Unix属于____操作系统。', N'C', N'opt', N'批处理', N'实时', N'分时', N'多道批处理', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (81, N'通常要求同一逻辑结构中的所有数据元素具有相同的特性，这意味着（  ）', N'B', N'opt', N'数据元素具有同一特点', N'不仅数据元素所包含的数据项的个数要相同，而且对应的数据项的类型要一致', N'每个数据元素都一样', N'数据元素所包含的数据项的个数要相等', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (82, N'下列叙述中,正确的一条是____。', N'B', N'opt', N'计算机能直接识别并执行用高级程序语言编写的程序', N'用机器语言编写的程序可读性最差', N'机器语言就是汇编语言', N'高级语言的编译程序属于应用软件', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (83, N'计算机感染病毒的可能途径之一是_____。', N'D', N'opt', N'从键盘上输入数据', N'通过电源线', N'所使用的软盘表面不清洁', N'随意打开不明来历的电子邮件', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (84, N'调制解调器(Modem)的作用是____。', N'C', N'opt', N'将计算机的数字信号转换成模拟信号', N'将模拟信号转换成计算机的数字信号', N'将计算机数字信号与模拟信号互相转换', N'为了上网与接电话两不误', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (85, N'在微机中,1GB的准确值等于____。', N'C', N'opt', N'1024×1024Bytes', N'1024KB', N'1024MB', N'1000×1000KB', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (86, N'堆是一种有用的数据结构。下列关键码序列（ ）是一个堆。', N'D', N'opt', N'A．94，31，53，23，16，72', N'B．94，53，31，72，16，23', N'C．16，53，23，94，31，72', N'D．16，31，23，94，53，72', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (87, N'一个字符的标准ASCII码用____位二进制位表示。', N'B', N'opt', N'8', N'7', N'6', N'4', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (88, N'在计算机硬件技术指标中,度量存储器空间大小的基本单位是____。', N'A', N'opt', N'字节(Byte)', N'二进位(bit)', N'字(Word)', N'', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (89, N'Internet实现了分布在世界各地的各类网络的互联,其最基础和核心的协议是____。', N'B', N'opt', N'HTTP', N'TCP/IP', N'HTML', N'FTP', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (90, N'下列叙述中,正确的一条是____。', N'B', N'opt', N'CPU能直接读取硬盘上的数据', N'CPU能直接与内存储器交换数据', N'CPU由存储器和控制器组成', N'CPU主要用来存储程序和数据', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (91, N'若某二叉树有20个叶子结点，有30个结点仅有一个孩子，则该二叉树的总结点个数为____。', N'69', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (92, N'办公室自动化(OA)是计算机的一项应用,按计算机应用的分类,它属于____。', N'D', N'opt', N'科学计算', N'辅助设计', N'实时控制', N'数据处理', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (93, N'正在工作的微机突然断电,此时计算机____中的信息将全部丢失,并且恢复供电后也无法恢复这些信息。', N'B', N'opt', N'软盘', N'RAM', N'硬盘', N'ROM', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (94, N'在下列网络的传输介质中,抗干扰能力最好的一个是____', N'A', N'opt', N'光缆', N'同轴电缆', N'双绞线', N'电话线', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (95, N'实现计算机网络需要硬件和软件。其中负责管理整个网络各种资源、协调各种操作的软件叫做____。', N'D', N'opt', N'网络应用软件', N'通信协议软件', N'OSI', N'网络操作系统', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (96, N'在因特网(Internet)中,电子公告板的缩写是____。', N'C', N'opt', N'FTP', N'WWW', N'BBS', N'E-mail', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (97, N'网络协议是____', N'B', N'opt', N'网络用户使用网络资源时必须遵守的规定', N'网络计算机之间进行通信的规则', N'网络操作系统', N'用于编写通信软件的程序设计语言', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (98, N'目前普遍使用的微型计算机,所采用的逻辑元件是____。', N'B', N'opt', N'电子管', N'大规模和超大规模集成电路', N'晶体管', N'小规模集成电路', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (99, N'冯·诺依曼对现代计算机的主要贡献是____', N'D', N'opt', N'设计了差分机', N'设计了分析机', N'建立了理论模型', N'确立了计算机的基本结构', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (100, N'计算机中所有信息的存储都采用____。', N'A', N'opt', N'二进制', N'八进制', N'十进制', N'十六进制', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (101, N'下面是关于操作系统的四条简单叙述,其中正确的一条为____。', N'C', N'opt', N'操作系统是软件和硬件的接口', N'操作系统是源程序和目标程序的接口', N'操作系统是用户和计算机之间的接口', N'操作系统是外设与主机之间的接口', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (102, N'一般为了提高屏幕输出图像的质量,可进行如下处理____。', N'B', N'opt', N'提高显示器的分辨率', N'在显示属性中改变颜色数', N'减少程序的运行', N'增加系统的内存', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (103, N'操作系统中,大多数文件扩展名________', N'A', N'opt', N'表示文件类型', N'表示文件属性', N'表示文件重要性', N'可以随便命名', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (104, N'下列说法中,_______是不正确的。', N'C', N'opt', N'使用打印机要安装打印驱动程序', N'打印机种类很多,有激光打印机、喷墨打印机、针式打印机等', N'目前针式打印机已经被淘汰', N'打印机的性能指标之一是打印速度', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (105, N'下列文件扩展名中,________不是常用的图像文件格式。', N'A', N'opt', N'WA V', N'TIF', N'JPG', N' GIF', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (106, N'下列编码中,________不属于汉字输入码。', N'A', N'opt', N'点阵码', N'区位码', N'全拼输入码', N'五笔字型码', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (107, N'下列格式文件中,________是视频文件。', N'B', N'opt', N'GIF格式文件', N'A VI格式文件', N'SWF格式文件', N'MID格式文件', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (108, N'真彩色图像的像素深度为________。', N'B', N'opt', N'32', N'24', N'16', N'8', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (109, N'下列软件中,________是数据库管理系统。', N'D', N'opt', N'PowerPoint2000', N'Excel2000', N'FrontPage2000', N'Access2000', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (110, N'微机在工作中突然掉电,则计算机中________的内容将会丢失。', N'A', N'opt', N'RAM', N'ROM', N'CD-ROM', N'硬盘', N'')
GO
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (111, N'从计算机采用的主要元器件看,目前使用的Pentium4个人计算机是________计算机。', N'A', N'opt', N'第四代', N'第五代', N'智能', N'巨型', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (112, N'地址为190.180.66.255的IP地址属于________类IP 地址。', N'B', N'opt', N'A', N'B', N'C', N'D', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (113, N'将计算机用于自然语言理解、知识发现,这属于计算机在________方面的应用。', N'D', N'opt', N'数值计算', N'自动控制', N' 管理和决策', N'人工智能', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (114, N' 常用的图像输入设备是________', N'D', N'opt', N'键盘与和绘图仪', N'数码相机和手写笔', N'扫描仪和绘图仪', N'扫描仪和数码相机', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (115, N' 引入操作系统的主要目的是________', N'D', N'opt', N'操作简单', N'提供操作命令', N'保证计算机程序正确执行', N'管理系统资源,提高资源利用率,方便用户使用', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (116, N'二进制数(01111111)转换为十进制数是________。', N'C', N'opt', N'125', N'126', N' 127', N'128', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (117, N'软件生命周期包括________、总体设计、详细设计、编码、测试和维护等几个阶段。', N'A', N'opt', N'需求分析', N'确定目标', N'孕育', N'诞生', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (118, N'计算机动画按运动控制方式分为________。', N'D', N'opt', N'关键帧动画和算法动画', N'算法动画和基于物理的动画', N'关键帧动画和基于物理的动画', N'关键帧动画、算法动画和基于物理的动画', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (119, N'目前大多数数据库管理系统采用________数据模型。', N'A', N'opt', N'关系', N'层次', N'网状', N'面向对象', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (120, N'算法的评价指标不包括________。', N'C', N'opt', N'健壮性', N'可读性', N'容错性', N'时间复杂性', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (121, N'在存储容量表示中,1TB等于________。', N'B', N'opt', N'1024MB', N' 1024GB', N' 1000GB', N'1000MB', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (122, N'术语HTML的含义是________。', N'A', N'opt', N'超文本标识语言', N'WWW编程语言', N'网页制作语言', N'通信协议', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (123, N'IP地址的子网掩码的作用是________。', N'D', N'opt', N'用于掩藏子网,防止黑客攻击', N'用于计算子网中主机的数', N'用于掩藏IP地址,防止IP地址被盗用', N'用于屏蔽部分IP地址,达到区分网', N'')
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (125, N'.在微型机中，信息的基本存储单位是字节，每个字节内含__________个二进制位。', N'8', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (126, N'数据通信网络中最常用的有线介质是电话线、双绞线、同轴电缆和__________。', N'光纤', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (127, N'_________界面是Windows 7下一种全新图形界面，其特点是透明的玻璃图案中带有精致的窗口动画和新窗口颜色。  ', N'Aero', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (128, N'在Flash CS4中，制作__________动画必须使用矢量图形对象才可以制作。 ', N'形状渐变、补间形状', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (129, N'在Windows中，各个应用程序之间可通过__________交换信息。 ', N'剪贴板', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (130, N'冯·诺依曼结构的计算机是由运算器、控制器、__________、输入设备和输出设备等五大部件组成的。', N'存储器', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (131, N'IPv4采用的地址长度为32位，IPv6采用的地址长度为__________。', N'128', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (132, N'在Word中，按<__________>+<A>键实现对整个文档的选择。', N'存储器', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (133, N'在Excel中，为了进行分类汇总，必须先对关键字段进行__________。 ', N'排序', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (134, N'PowerPoint 2010模板文件的扩展名是__________。  ', N' POTX、.potx', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (135, N'在Windows中，很多可用来设置计算机各项系统参数的功能模块集中在__________上。   ', N'控制面板', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (136, N'多媒体计算机的主要功能是处理__________化的声音、图像及视频信号等。  ', N'数字', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (137, N'从逻辑功能上可把计算机网络分为资源子网和__________子网。  ', N'通讯', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (138, N'把软件分为两大类：系统软件和应用软件，设备驱动软件属于__________软件。   ', N'系统', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (139, N'.Windows操作系统属于单用户__________任务操作系统。 ', N'多', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (140, N'在星形结构计算机网络中，__________节点出现故障，可能会导致该网络瘫痪。', N'中央', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (141, N'赋予计算机“讲话”的能力，用声音输出结果，属于语音__________技术。', N'合成', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (142, N'网页表格的宽度可以用百分比和____ ______表示。   ', N'像素、px', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (143, N'在Word文档中可选用的段落对齐方式有左对齐、右对齐、居中对齐、分散对齐和

__________对齐五种。  ', N'两端', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (144, N'在Windows中，将文件类型与一个应用程序设置__________以后，可以默认使用指定的应用程序打开该类型的文件。  ', N'关联', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (145, N'用__________语言编写的程序可以直接被计算机识别和执行。 ', N'机器', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (146, N'网页表格的宽度可以用像素和__________两种单位来设置。', N'百分比、%', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (147, N'WWW服务是以__________协议为基础。   ', N'超文本传输', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (148, N'在Windows中欲直接删除某个文件，而不将其放入回收站，应使用 
 <_________> + <Del> 键。   ', N'Shift', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (149, N'目前发展的云计算可以认为是并行计算、分布式计算和__________计算的发展。   ', N'网格', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (150, N'按信号在传输过程中的表现形式可以把信号分为__________信号和数字信号。', N'模拟', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (151, N'十进制数255转换成十六进制数是__________H。 ', N'FF', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (152, N'Windows启动后，系统进入全屏幕区域，整个屏幕区域称之__________。   ', N'桌面Desktop', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (153, N'超文本标记语言的英文简称是_________。   ', N'HTML', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (154, N'在Word 2010中，执行“页面布局”选项卡“__________”组中的页边距命令可以设置页边距。', N'页面设置', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (155, N'光盘的类型有__________光盘、一次性写光盘和可擦写光盘三种。   ', N'只读', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (156, N'在计算机的外部设备中，除外存储器：软盘、硬盘、光盘和磁带机等外，最常用的输入设备是键盘、__________。  ', N'鼠标', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (157, N'计算机图形图像通常有两种描述方法。一种称为点阵图像，另一种称为__________图形。  ', N'矢量', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (158, N'在Word文档中可选用的段落对齐方式有左对齐、右对齐、居中对齐、分散对齐和__________对齐五种。   ', N'两端', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (159, N'在PowerPoint放映过程中，若要中途退出播放状态，可随时按键盘上的____ ______键。', N'Esc', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (160, N'赋予计算机“讲话”的能力，用声音输出结果，属于__________技术', N'语音合成', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (161, N'', N'', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (162, N'在微型机中，信息的基本存储单位是字节，每个字节内含__________个二进制位。', N'8', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (163, N'数据通信网络中最常用的有线介质是电话线、双绞线、同轴电缆和__________。', N'光纤', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (164, N'IPv4采用的地址长度为32位，IPv6采用的地址长度为__________。', N'128', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (165, N'在Excel中，为了进行分类汇总，必须先对关键字段进行__________。 ', N'排序', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (166, N'从逻辑功能上可把计算机网络分为资源子网和__________子网。   ', N'通讯', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (167, N'把软件分为两大类：系统软件和应用软件，设备驱动软件属于__________软件。   ', N'系统', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (168, N'赋予计算机“讲话”的能力，用声音输出结果，属于语音__________技术。', N'合成', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (169, N'在Windows中，将文件类型与一个应用程序设置__________以后，可以默认使用指定的应用程序打开该类型的文件。   ', N'关联', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (170, N'用__________语言编写的程序可以直接被计算机识别和执行。  ', N'机器', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (171, N'________音频是将电子乐器演奏时的指令信息通过声卡上的控制器输入计算机或利用一些计算机处理软件编辑产生音乐指令集合。', N'MIDI', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (172, N'目前发展的云计算可以认为是并行计算、分布式计算和__________计算的发展。   ', N'网格', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (173, N'______病毒不需要依附于其他可执行程序上而可独立复制自身，并在网络上大肆传播，造成网络流量急剧增加。   ', N'蠕虫', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (174, N'计算机图形图像通常有两种描述方法。一种称为点阵图像，另一种称为__________图形。   ', N'矢量', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (175, N'在计算机的外部设备中,除外存储器:软盘、硬盘、光盘和磁带机等外,最常用的输入设备有键盘、_________。', N'鼠标', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (176, N'信息可以由一种形态_________为另一种形态,是信息的特征之一。', N'转换', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (177, N'计算机技术和_________相结合形成了计算机网络', N'通信技术', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (178, N'从数据管理和通信的角度出发,数据又可以被看作是信息的______ ', N'载体', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (179, N'微波线路传输具有容量大、直线传播的特点,其缺点是易受______ 的影响、长途传输必须建立中继站。', N'环境,电磁,干扰', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (180, N'常用的打印机有击打式、______ 式和激光打印机三种。', N'喷墨', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (181, N'Cache是一种介于CPU和______ 之间的的可高速存取数据的芯片。', N'内存,主存', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (182, N'计算机软件分为系统软件和应用软件。打印机驱动程序属于______ 软件。', N'系统', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (183, N'物质、能源和_________是人类社会赖以生存、发展的三大重要资源', N'信息', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (184, N'汉字以24*24点阵形式在屏幕上单色显示时,每个汉字占用_________字节。', N'72', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (185, N'幻灯片上使用的标题、小标题文字、图片、图表和表格等,PowerPoint统称它们为_________。', N'占位符', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (186, N'在Excel中,有三种表示单元格地址的类型,分别是相对地址、绝对地址和________地址', N'混合', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (187, N'Windows XP可以按不同的方式排列桌面图标,除了自动排列方式外,其他四种方式是按名称、按类型、按大小、按_______排列。', N'时间', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (188, N'Windows是通过__________来完成计算机系统的软、硬件资源管理', N'资源管理器', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (189, N'在Windows XP中,很多可用来设置计算机各项系统参数的功能模块集中在________上。', N'控制面板', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (190, N'在Word中,执行“文件”菜单中的_______命令可以设置页边距', N'页面设置', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (191, N'在Excel中已输入的数据清单含有字段:编号、姓名和工资,若希望只显示最高工资前5名的职工信息,可以使用________功能。', N'筛选', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (192, N'在Windows XP资源管理器中删除文件时,如果在删除的同时按下__________键,文件即被彻底删除。', N'Shift', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (193, N'在Windows中,用鼠标单击所选对象,可以弹出该对象的_________。', N'快捷菜单', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (194, N'Word中,按“_________”键可将光标移到下一个制表位上', N'Tab', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (195, N'在Windows XP中,要关闭当前应用程序,可按Alt+______键', N'F4', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (196, N'在Excel的工作簿内,若对一张工作表Sheet2 进行了复制,复制后的工作表副本自动取名为________。', N':Sheet2 (2)', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (197, N'在Excel的工作簿内,若对一张工作表Sheet2 进行了复制,复制后的工作表副本自动取名为________。', N':Sheet2 (2)', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (198, N'数据压缩算法可分无损压缩和__________压缩两种。', N'有损', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (199, N'波形文件的扩展名是__________。', N'WAV', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (200, N'表示图像的色彩位数越多,则同样大小的图像所占的存储空间越____________。', N'大', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (201, N'赋予计算机“讲话”的能力,用声音输出结果,属于_____________技术。', N'语音合成', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (202, N'视频中包含了大量的图像序列,图像序列中两幅相邻的图像之间有着较大的相关,这表现为____________冗余', N'时间', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (203, N'FTP是指________协议(写中文)。', N'文件传输', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (204, N'计算机网络中的用户必须共同遵从的多项约定,称为________。', N'协议', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (205, N'互连起来通过协议相互通信并且相互独立的计算机集合称为计算机________。', N'网络', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (206, N'在计算机网络中常见的三种有线传输介质是________、同轴电缆和光纤。', N'双绞线', N'blank', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Questions] ([que_id], [que_head], [que_ans], [que_type], [que_opt_a], [que_opt_b], [que_opt_c], [que_opt_d], [que_opt_e]) VALUES (207, N'宽带入网方式中“非对称数字用户环路”的英文缩写为_______。', N'ADSL', N'blank', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Questions] OFF
INSERT [dbo].[test] ([test_id]) VALUES (N'10        ')
INSERT [dbo].[test] ([test_id]) VALUES (N'10        ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1000      ', N'admin     ', N'123456    ', 100, N'神圣的管理员    ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1503      ', N'不高兴       ', N'wsl       ', 10, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1504      ', N'李朗        ', N'123       ', 90, N'软件班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1507      ', N'华明        ', N'123988    ', 68, N'软件班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1509      ', N'马云        ', N'122533    ', 80, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1510      ', N'比尔盖茨      ', N'1233737   ', 99, N'软件班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1511      ', N'王健林       ', N'1542123   ', 89, N'软件班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1512      ', N'马化腾       ', N'1224533   ', 3, N'软件班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1513      ', N'奥巴马       ', N'12358     ', 86, N'软件班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1514      ', N'斯大林       ', N'124253    ', 56, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1515      ', N'叶利钦       ', N'12wdw3    ', 69, N'软件班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1516      ', N'马明        ', N'wefd123   ', 75, N'软件班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1517      ', N'马胜        ', N'12wqew3   ', 60, N'软件班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1518      ', N'马超        ', N'12eet3    ', 60, N'软件班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1519      ', N'司马光       ', N'12sdg3    ', 80, N'软件班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1520      ', N'李泽        ', N'12er3     ', 60, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1521      ', N'李渊        ', N'1722ft3   ', 60, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1522      ', N'李更        ', N'1286333   ', 76, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1523      ', N'李里        ', N'127fdh733 ', 68, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1524      ', N'明月        ', N'12723yio  ', 78, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1525      ', N'呼延落       ', N'123733    ', 90, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1527      ', N'萧炎        ', N'127896    ', 88, N'信息班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1528      ', N'萧熏儿       ', N'12737558  ', 55, N'电子班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1529      ', N'礼泽鸿       ', N'12793293  ', 76, N'电子班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1530      ', N'李继        ', N'1272dh83  ', 82, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1531      ', N'张祖        ', N'1uho23733 ', 77, N'电子班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1532      ', N'张莱        ', N'127awed3  ', 68, N'信息班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1534      ', N'莱佐        ', N'127237433 ', 73, N'电子班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1535      ', N'名博        ', N'1272ty3   ', 70, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1536      ', N'魏乾        ', N'1272jil33 ', 78, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1537      ', N'爱星觉罗溥仪    ', N'12754733  ', 76, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1538      ', N'金星        ', N'12728573  ', 77, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1539      ', N'金鸿        ', N'120cfh33  ', 16, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1540      ', N'魔琨        ', N'102533    ', 80, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1541      ', N'莫言        ', N'127dfh733 ', 82, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1542      ', N'燕燕        ', N'19933     ', 45, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1543      ', N'皇太极       ', N'1992723733', 86, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1544      ', N'小明        ', N'12729933  ', 65, N'通信班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1545      ', N'赵臻        ', N'1ftyt733  ', 77, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1546      ', N'孙仪        ', N'178yfgyj33', 86, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1547      ', N'苏秦        ', N'1yiyo33   ', 74, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1548      ', N'苏敏        ', N'153533    ', 88, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1549      ', N'赫敏        ', N'12799993  ', 73, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1550      ', N'哈利        ', N'12793     ', 87, N'计科班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1551      ', N'金苇        ', N'qwe       ', 56, N'电子班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1552      ', N'王丽        ', N'14        ', 76, N'电子班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1553      ', N'眭镇涛       ', N'1244      ', 93, N'电子班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1554      ', N'王子杰       ', N'3254      ', 76, N'电子班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1580      ', N'小张        ', N'123       ', 88, N'信息班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1581      ', N'崔锐捷       ', N'123gsef84 ', 59, N'信息班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1582      ', N'张拉拉       ', N'741963.wd ', 67, N'信息班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1583      ', N'耿豪        ', N'126981654 ', 90, N'信息班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1584      ', N'小胖        ', N'1606103aw ', 76, N'信息班       ')
INSERT [dbo].[UserInfo] ([user_id], [user_name], [user_password], [user_grade], [user_class]) VALUES (N'1585      ', N'戴月        ', N'456wefa165', 77, N'信息班       ')
ALTER TABLE [dbo].[Paper]  WITH CHECK ADD FOREIGN KEY([que_id])
REFERENCES [dbo].[Questions] ([que_id])
GO
USE [master]
GO
ALTER DATABASE [Exam] SET  READ_WRITE 
GO
