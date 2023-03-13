\newpage

# Release: Fat App

## Platform

|   OS          |  OS version  | Language |
|---------------|--------------|----------|
| Android       |      -       | Groovy   |

## Main characteristic

| ID      | Title  | Category    | Sub-category |
|---------|--------|-------------|--------------|
| EREL001 | FatApp | Environment | Release      |

## Severity / Remediation Cost

| Severity | Remediation Cost |
|----------|------------------|
| Major    | Major            |

## Rule short description

Using "multiDexEnabled true" goes against the overall reduction of the weight of the apps and hence must be avoided.

## Rule complete description

## Text

When an app exceeds the limit of 65 536 method references, the configuration multidex must be enabled with \
multiDexEnabled true in the defaultConfig section of build.gradle. \
Switching to that configuration of multiple dex files goes against the overall reduction of \
the weight of the apps and hence must be avoided.

## HTML

```html
<p>When an app exceeds the limit of 65 536 method references, the configuration multidex must be enabled with \
 <code>multiDexEnabled true</code> in the <code>defaultConfig</code> section of build.gradle. \
Switching to that configuration of multiple dex files goes against the overall reduction of \
the weight of the apps and hence must be avoided.</p>
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
            multiDexEnabled true


            testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
        }

        buildTypes {
            release {
                minifyEnabled false
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

- In the build.gradle file check for the value of `multiDexEnabled`, it should be `false` or not declared.
