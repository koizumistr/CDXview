# CDXview

## in simple English
A lousy tool to view CycloneDX

## 日本語での説明
（主にOSSの）ライセンスを確認しないといけないのに、「SBOMを提供して。SPDX（Lite）なら慣れているけど、別に書式は強制しないよ」と言ったら、相手がCycloneDX（JSON形式）を送りつけてきた場合に使えるツールです。
PackageFileName,PackageVersion,licenseをCSV形式で出力します。PackageFileName,PackageVersionはSPDX Liteに合わせてますので自明でしょう。licenseに関しては制限事項を読んでください。

### 制限事項
1. SPDX (Lite)でのライセンスはPackageLicenseConclueded/PackageLicenseDeclaredなのは知っていて、それに対応するCycloneDXの書き方も知らないわけではないですが、そこら辺を頑張ってCycloneDXから抽出してきているわけではないです。なので、出力の項目名が"license"と（そしてA "lousy" toolと）。
1. 一つのコンポーネントに対して"license"が複数ある場合には、その旨を警告して、最初に見つけた"license"をlicenseとして扱います。
