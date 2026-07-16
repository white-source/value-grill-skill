# Value Boardroom Skills（价值董事会议室技能库）

> English | **简体中文** | [日本語](README.ja.md) | [Español](README.es.md)

便携的 Agent Skills 库，帮助投资者以**所有者和经营者**的视角研究上市公司。它通过角色扮演式的苏格拉底式董事会对话，把经营选择与未来自由现金流（FCF）联系起来——而不是生成通用的投资报告或交易建议。

## 目的

- 理解一家公司如何**创造、消耗、分配**现金。
- 以董事或控股股东的身份思考，而非短线交易者。
- 把已核实的事实与管理层声明、推断、建模假设、未知项区分开来。
- 把各部门的洞察，转化为少量、可检验的 FCF 驱动因素、情景和反证。

## 安装

两种安装方式，两种理念：

- **Skills CLI**：把技能复制进你的项目，可自行编辑、改成你自己的。
- **Claude Code 插件**：作为托管、只读、始终最新的捆绑包，你订阅而非 fork。

### 方式一 —— Skills CLI（可编辑，兼容任意 Agent Skills 工具）

```bash
npx skills@latest add white-source/value-grill-skill
```

兼容 Claude Code、Codex、Cursor、Copilot 及其他 Agent Skills 标准的工具。文件会复制进你的仓库，归你所有、可自由修改。

### 方式二 —— Claude Code 插件（托管、即装即用）

想要即装即用、不用手动维护？本技能集也以原生 Claude Code 插件形式发布。它不复制可编辑文件，而是把整套技能作为托管捆绑包安装，发布新版本时自动更新。

在 Claude Code 内：

```
/plugin marketplace add white-source/value-grill-skill
/plugin install value-grill-skill@white-source
```

或在命令行：

```bash
claude plugin marketplace add white-source/value-grill-skill
claude plugin install value-grill-skill@white-source
```

无需额外的 setup 步骤，装好后直接 `/value-boardroom [公司]` 开始。

## 开始

```
/value-boardroom [公司名称或代码]
```

会话开始时会确认：公司（以及标识符/市场，若已知）、截止日期、研究目标、证据模式（仅用户提供，或在 agent 可联网时进行公开网络研究）、以及角色模式。

## 两种角色模式

| 模式 | 模型 | 用户 | 学到什么 |
|---|---|---|---|
| `briefing`（默认） | 模拟选定的高管，包括其激励与约束 | 董事 / 合伙人 | 通过追问经营细节来学习 |
| `examination` | 模拟董事会 | CEO、CFO 或选定的高管 | 检验你能否把生意讲清楚 |

## 命令一览

| 命令 | 作用 |
|---|---|
| `/value-boardroom [公司]` | 初始化或重置一个公司董事会会话 |
| `/role <角色>` | 切换到某位高管的汇报（十四个经营角色之一） |
| `/research [主题]` | 收集或请求可核实的公开信息，并按证据类别归类 |
| `/assumption` | 查看或修订关键建模假设 |
| `/evidence` | 显示证据台账 |
| `/cashflow` | 把经营成果转化为营收、利润率、营运资本、CapEx、FCF、ROIC |
| `/stress-test [冲击]` | 跑一个命名冲击，或沿现金流链条构建熊/基准/牛情景 |
| `/kill [年份]` | 预演破产：假设到所选年份现金流失败，再倒推原因 |
| `/board-summary` | 退出角色扮演，汇总出可追溯的董事会结论 |

## 证据类别

每条主张都会打标签，保证结论可追溯：

| 类别 | 含义 |
|---|---|
| `Fact` | 有来源支持的主张，含发布日期与出处 |
| `Management statement` | 公司的声明，尚未独立核实 |
| `Inference` | 由已引用事实推导出的经营结论 |
| `Assumption` | 可被证伪的模型输入 |
| `Unknown` | 没有可靠支持的重要信息 |

## 网络研究

在可用时会使用公开网络研究并标注来源与日期。当研究工具不可用时，技能会**诚实降级**：说明缺失的证据、列出应查阅的一手来源、给出检索建议、并提出下一个董事会问题。绝不编造数据、来源、访问权限或核实结果。

## 安全边界

这是一个研究与学习框架。它**不**提供投资建议、目标价、买卖持有判断或交易指令。

## 验证

```bash
npm test
```

运行 Node 内置测试（`node --test tests/skills.test.mjs`），校验技能目录结构、frontmatter、共享引用和安全契约。需要 Node 20+。

## 许可证

MIT
