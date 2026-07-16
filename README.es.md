# Value Boardroom Skills (Habilidades de Sala de Juntas)

> [English](README.md) | [简体中文](README.zh-CN.md) | [日本語](README.ja.md) | **Español**

Biblioteca portátil de Agent Skills que ayuda a un inversor a estudiar una empresa cotizada como **propietario y operador**. Usa conversaciones socráticas basadas en roles, estilo sala de juntas, para conectar las decisiones operativas con el flujo de caja libre (FCF) futuro, en lugar de producir informes de inversión genéricos o recomendaciones de trading.

## Propósito

- Entender cómo una empresa **crea, consume y asigna** el efectivo.
- Razonar como un director o propietario controlante, no como un trader a corto plazo.
- Separar los hechos verificados de las afirmaciones de la dirección, las inferencias, los supuestos del modelo y lo desconocido.
- Convertir el conocimiento de cada departamento en un conjunto reducido y comprobable de drivers de FCF, escenarios y contraevidencia.

## Instalación

Hay dos formas de instalar, dos filosofías:

- **Skills CLI** copia las habilidades en tu proyecto para que las edites y las hagas tuyas.
- **Plugin de Claude Code** las mantiene como un paquete gestionado, de solo lectura y siempre actualizado, al que te suscribes en lugar de hacer un fork.

### Opción 1 — Skills CLI (editable, funciona con cualquier entorno Agent Skills)

```bash
npx skills@latest add white-source/value-grill-skill
```

Compatible con Claude Code, Codex, Cursor, Copilot y otros entornos compatibles con Agent Skills. Los archivos se copian en tu repositorio y son tuyos para modificar.

### Opción 2 — Plugin de Claude Code (gestionado, plug-and-play)

¿Prefieres una instalación plug-and-play que no mantengas a mano? Este conjunto de habilidades también se distribuye como plugin nativo de Claude Code. En lugar de copiar archivos editables en tu repositorio, el plugin instala todo el conjunto como un paquete gestionado que se actualiza cuando se publica una nueva versión.

Dentro de Claude Code:

```
/plugin marketplace add white-source/value-grill-skill
/plugin install value-grill-skill@white-source
```

O desde tu terminal:

```bash
claude plugin marketplace add white-source/value-grill-skill
claude plugin install value-grill-skill@white-source
```

No hace falta ningún paso de configuración adicional: inicia con `/value-boardroom [empresa]` enseguida.

## Inicio

```
/value-boardroom [nombre de empresa o ticker]
```

Al iniciar, la sesión confirma la empresa (y el identificador/mercado si se conoce), la fecha de corte, el objetivo de investigación y el modo de evidencia. El modo de rol es una sola pregunta rápida (predeterminado `briefing`) — sin banderas que escribir.

## Inversión de roles — el mecanismo central

La característica distintiva de esta biblioteca es la **inversión de roles**: puedes estudiar una empresa desde cualquiera de los dos lados de la mesa de la junta, y los mismos catorce roles operativos funcionan en ambas direcciones.

| Modo | El modelo interpreta | Tú interpretas | Por qué usarlo |
|---|---|---|---|
| `briefing` (predeterminado) | El ejecutivo seleccionado — con sus incentivos, presupuestos y conflictos | Un director / socio que pregunta | Construyes entendimiento interrogando el detalle operativo real; el ejecutivo debe justificar cada cifra hasta el flujo de caja |
| `examination` | La junta | El CEO, CFO o ejecutivo seleccionado — respondiendo | Pone a prueba si *tú* de verdad entiendes el negocio; la junta expone los huecos y las evasivas de tu propio razonamiento |

**briefing** = aprender interrogando. **examination** = aprender siendo interrogado. Eliges el modo con una pregunta rápida al iniciar (predeterminado `briefing`) y lo cambias en cualquier momento con `/mode` — o simplemente dilo («invierte los roles», «examíname»). No hace falta reiniciar. En ambos casos el contrato de cada turno es idéntico: afirmar un hecho o supuesto etiquetado, exponer un conflicto de incentivos, trazar una ruta clara hacia el flujo de caja y formular exactamente una pregunta.

## Roles operativos

Catorce roles cubren toda la empresa. Entra en uno con el atajo autocompletable `/role-<rol>` (p. ej. `/role-cfo`), encadena varios con `/role ceo cfo ...`, o avanza con `/next`. Cada rol habla solo dentro de su ámbito, expone un conflicto de presupuesto o estrategia y conecta su punto con ingresos, costes, capital circulante, CapEx o asignación de capital.

| Rol | De qué se encarga | Qué interrogar |
|---|---|---|
| `secretary` | Secretario de junta / coach — agenda, árbol de preguntas, evidencia, supuestos | Que cada conclusión tenga fuente y sea trazable |
| `ceo` | CEO — fuentes de crecimiento, límites estratégicos, asignación de capital | Crecimiento orgánico vs por adquisiciones, tasa de reinversión, rentabilidad del capital |
| `cfo` | CFO — calidad del beneficio, apalancamiento, capital circulante, asignación | Ciclo de conversión de caja, beneficio devengado vs en caja, CapEx de mantenimiento vs crecimiento |
| `product` | Producto / I+D — problema del cliente, hoja de ruta, riesgo de sustitución | Poder de precios, retención/churn, eficiencia de I+D |
| `marketing` | Marketing / marca — adquisición, fidelidad, dependencia de publicidad | CAC, LTV, qué cae primero si se detiene la publicidad |
| `sales` | Ventas — calidad de pedido, precios, concentración | Precio realizado tras descuentos, concentración de clientes, cuentas por cobrar |
| `channel` | Canal — inventario de distribuidor, merchandising, rebajas | Días de inventario en canal, sell-through, margen de canal |
| `supply` | Cadena de suministro / compras — costes de inputs, poder de negociación | Concentración de proveedores en COGS, condiciones de contrato, plazos |
| `operations` | Operaciones / fabricación — utilización, rendimiento, coste unitario | Utilización de capacidad, absorción de costes fijos, CapEx de expansión |
| `customer-success` | Éxito del cliente / posventa — retención, churn, renovaciones | Retención bruta/neta, expansión vs contracción, coste de servicio |
| `people` | Personas / organización — talento crítico, incentivos, sucesión | Rotación en puestos clave, estructura de incentivos, cuellos de botella |
| `legal-risk` | Legal / cumplimiento / riesgo — licencias, litigios, regulación | Pasivos contingentes, exposición regulatoria, gobierno de datos |
| `strategy-ma` | Estrategia / M&A — nuevas líneas, expansión, adquisiciones | Retornos post-adquisición, fondo de comercio, coste de integración |
| `ir-pr` | IR / RR.PP. — compromisos, transparencia, reputación | Guía pública vs resultados reales, narrativa vs operaciones |

## Mapa de comandos

| Comando | Qué hace |
|---|---|
| `/value-ask [pregunta u objetivo]` | Describe lo que quieres; recibe el comando adecuado con una explicación |
| `/value-boardroom [empresa]` | Inicializa o reinicia una sesión de sala de juntas |
| `/mode [briefing\|examination]` | Cambia el modo de rol en cualquier momento — o simplemente dilo |
| `/role-<rol>` | Atajo de rol único con **autocompletado** — escribe `/role-` y elige (p. ej. `/role-cfo`) |
| `/role [rol...]` | Encadena varios ejecutivos en secuencia, p. ej. `/role ceo cfo supply` |
| `/next` | Avanza al siguiente rol del recorrido sugerido — sin reescribir |
| `/research [tema]` | Recopila o solicita información pública verificable y la clasifica por clase de evidencia |
| `/assumption` | Ver o revisar los supuestos materiales del modelo |
| `/evidence` | Muestra el libro mayor de evidencia |
| `/cashflow` | Convierte resultados operativos en ingresos, margen, capital circulante, CapEx, FCF y ROIC |
| `/stress-test [shock]` | Ejecuta un shock nombrado o construye escenarios pesimista/base/optimista a lo largo de la cadena de flujo de caja |
| `/kill [año]` | Pre-mortem: asume fallo de flujo de caja para el año elegido y trabaja hacia atrás |
| `/board-summary` | Sale del roleplay y sintetiza una conclusión trazable de la junta |

## Clases de evidencia

Cada afirmación se etiqueta para que las conclusiones sigan siendo trazables:

| Clase | Significado |
|---|---|
| `Fact` | Una afirmación respaldada por una fuente, con fecha y origen |
| `Management statement` | Una afirmación de la empresa no verificada de forma independiente |
| `Inference` | Una conclusión operativa derivada de hechos citados |
| `Assumption` | Una entrada del modelo que podría ser falsada |
| `Unknown` | Información material sin respaldo fiable |

## Investigación web

Cuando está disponible, se usa investigación web pública con fecha y fuente. Cuando las herramientas de investigación no están disponibles, las habilidades **se degradan con honestidad**: indican la evidencia que falta, nombran las fuentes primarias a consultar, sugieren búsquedas y plantean la siguiente pregunta para la junta. Nunca inventan datos, fuentes, accesos ni verificaciones.

## Límite de seguridad

Este es un marco de investigación y aprendizaje. **No** proporciona recomendaciones de inversión, precios objetivo, llamadas de comprar/vender/mantener ni instrucciones de trading.

## Verificación

```bash
npm test
```

Ejecuta el ejecutor de pruebas integrado de Node (`node --test tests/skills.test.mjs`), que valida el diseño de las habilidades, el frontmatter, las referencias compartidas y los contratos de seguridad. Requiere Node 20+.

## Licencia

MIT
