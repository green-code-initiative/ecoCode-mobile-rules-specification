\newpage

# How to specify rules

## Platform

### OS

- iOS
- Android

### OS version

- a specific version - eg. 17
- a range of version - eg. 17 - 19
- all the versions: just put a "-"

### Language

- Java
- XML

## Main caracteristics

If the rules is in the document of Olivier Le Goaer : <https://pauware.univ-pau.fr/green/android-energy-smells>
please use the information provided.

### Title

The name of the rule (colomn name in Olivier array). Must be very short (a few words)

### Category

- Environment
- Social

### Sub-category

| Environment   | Social        |
|---------------|---------------|
| Optimized API | Privacy       |
| Leakage       | GDPR          |
| Bottleneck    | Inclusion     |
| Sobriety      | Accessibility |
| Idleness      |               |
| Power         |               |
| Batch         |               |
| Release       |               |

### ID

The identifier of a rule is built like that:

- First a letter: `E` (for Environment) or `S` (for Social)
- Then 3 letters: the 3 first letters of the sub-category. eg. `LEA` for Leakage.
- Then three number: `001` to `999`

For example for the first leakage rule we have the id: `ELEA001`

## Severity / Remediation Cost

### Severity

The severity can be seen as the impact of a rule in its category. Is it just a detail or is it fundamental ?
Here is an array to help choosing the severity level:

| Severity |                                                                 |
|----------|-----------------------------------------------------------------|
| Critical | Can be dramatic if not fix                                      |
| Major    | Important impact                                                |
| Minor    | Low impact                                                      |
| Info     | Not really a problem but needed to be say                       |
| Helpful  | Doing this will help to have a more eco-responsible application |

### Remediation cost

This is the evaluation of the cost of the remediation of the issue in a project.

| Remediation Cost |                                                                                                                          |
|------------------|--------------------------------------------------------------------------------------------------------------------------|
| None             | No cost - mainly for helpful rules                                                                                       |
| Trivial          | No need to understand the logic and no potential impact (removing import, logs...)                                       |
| Easy             | No need to understand the logic but potential impacts                                                                    |
| Medium           | Understanding the logic of a piece of code is required before doing a little and easy refactoring (1 or 2 lines of code) |
| Major            | Understanding the logic of a piece of code is required and it's up to the developer to define the remediation action     |
| High             | The remediation action might lead to locally impact the design of the application.                                       |
| Complex          | The remediation action might lead to an impact on the overall design of the application                                  |

## Rule short description

The short description is a small sentence that quickly explain the impact of the rule to the user.
It must be short and should directly engage the user.

eg.

- Failing to call `release()` on a Media Player may lead to lead to continuous battery consumption.
- Forcing brightness to max value may cause useless energy consumption.

## Rule complete description

### Text

The long description of the rule. It must explain the whole rule caracteristcs using the current language.

### HMTL

The HTML version of the rule description. It may contain a Non compliant and compliant code example.
Here is a template of the HTML description of a rule:

```html
<p>My long rule description with some <code>code</code> in it.</p>
<h2>Noncompliant Code Example</h2>
<pre>
MyCode code = new DirtCode();
</pre>
<h2>Compliant Solution</h2>
<pre>
MyCode code = new GoodCode()
</pre>
```

## Implementation principle

A description in current language on how to implement the rule based on an AST of the code.
