# CDXview

## in simple English
A lousy tool to view CycloneDX

## 日本語での説明
（主にOSSの）ライセンスを確認しないといけないのに、「SBOMを提供して。SPDX（Lite）なら慣れているけど、別に書式は強制しないよ」と言ったら、相手がCycloneDX（JSON形式）を送りつけてきた場合に使えるツールです。

PackageFileName,PackageVersion,licenseをCSV形式で出力します。PackageFileName,PackageVersionはSPDX Liteに合わせてますので自明でしょう。licenseに関しては制限事項を読んでください。

### 使い方
rubyのスクリプトですから
~~~
ruby cdxview.rb <送りつけられてしまったCycloneDX（JSON形式）のファイル>
~~~
で。rubyとかのインストールはやってある前提で。コマンドライン云々について他のところで勉強しておいてください。

### 実行例
https://www.cyclonedx.org/use-cases/open-source-licensing/ にある例を入力すると、こんな感じ。
~~~
$ ruby cdxview.rb example.json
PackageFileName,PackageVersion,license
Library A,3.7.1,Apache-2.0
Library B,1.0.2,EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0
Library C,2.0.0,Some other license
~~~

### 制限事項
1. SPDX (Lite)でのライセンスはPackageLicenseConclueded/PackageLicenseDeclaredなのは知っていて、それに対応するCycloneDXの書き方も知らないわけではないですが、そこら辺を頑張ってCycloneDXから抽出してきているわけではないです。なので、出力の項目名が"license"と（そしてA "lousy" toolと）。
1. 一つのコンポーネントに対して"license"が複数ある場合には、その旨を警告して、最初に見つけた"license"をlicenseとして扱います。
