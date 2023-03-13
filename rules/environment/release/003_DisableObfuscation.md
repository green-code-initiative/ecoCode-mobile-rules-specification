\newpage

# Release: Supported Version Range

## Platform

|   OS          |  OS version  | Language |
|---------------|--------------|----------|
| Android       |      -       | Groovy   |

## Main characteristic

| ID      | Title                 | Category    | Sub-category |
|---------|-----------------------|-------------|--------------|
| EREL003 | Disable Obfuscation   | Environment | Release      |

## Severity / Remediation Cost

| Severity | Remediation Cost |
|----------|------------------|
| Minor    | Easy             |

## Rule short description

Using minifyEnabled true will obfuscate code and will have a sligthly negative impact on power consumption at runtime.

## Rule complete description

## Text

Using minifyEnabled true will obfuscate code and will have a sligthly negative impact on power consumption at runtime.

## HTML

```html
Using minifyEnabled true will obfuscate code and will have a sligthly negative impact on power consumption at runtime.
<p>Example of violations:</p>
<pre>
    android {
        compileSdk 32

        defaultConfig {
            applicationId "com.example.sampleForSonar"
            minSdkVersion 28
            targetSdkVersion 32
            versionCode 1
            versionName "1.0"
            testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
        }

        buildTypes {
            release {
                minifyEnabled true
                proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
            }
        }
        compileOptions {
            sourceCompatibility JavaVersion.VERSION_1_8
            targetCompatibility JavaVersion.VERSION_1_8
        }
        buildFeatures {
            viewBinding true
        }
    }
</pre>
```

## Implementation principle

- In the build.gradle file check for the value of `minifyEnabled`, it should be `false` or not declared.
