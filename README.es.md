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

Al iniciar, la sesión confirma la empresa (y el identificador/mercado si se conoce), la fecha de corte, el objetivo de investigación, el modo de evidencia (solo aportado por el usuario, o investigación web pública cuando el agente puede acceder) y el modo de rol.

## Dos modos de rol

| Modo | Modelo | Usuario | Qué se aprende |
|---|---|---|---|
| `briefing` (predeterminado) | Simula al ejecutivo seleccionado, incluidos incentivos y restricciones | Director / socio | Se aprende interrogando el detalle operativo |
| `examination` | Simula a la junta | CEO, CFO o el ejecutivo seleccionado | Comprueba si puedes explicar el negocio con coherencia |

## Mapa de comandos

| Comando | Qué hace |
|---|---|
| `/value-boardroom [empresa]` | Inicializa o reinicia una sesión de sala de juntas |
| `/role <rol>` | Pasa al informe de un ejecutivo (uno de los catorce roles operativos) |
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
