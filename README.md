# youtube_init

YouTube コンテンツ制作/自動化の初期セットです。AI のワークフロー指針と最小限のスクリプトを含み、必要に応じて拡張できます。

## 概要
- 最小構成のディレクトリで、AI ワークフローのたたき台を提供します。
- `AI/scripts/youtube_gen.sh` による自動化のスタートポイントを用意しています。
- `AI/instructions/copilot_agent_workflow.md` に、AI エージェント運用の考え方・手順のメモがあります。

## ディレクトリ構成
```
/Users/haruma/youtube_init/
├── AI/
│   ├── instructions/
│   │   ├── .gitkeep
│   │   └── copilot_agent_workflow.md
│   ├── log/
│   │   └── .gitkeep
│   └── scripts/
│       └── youtube_gen.sh
├── README.md
└── lib/
    └── .gitkeep
```

- `AI/instructions/`:
  - AI ワークフローや運用メモを保管します。
- `AI/log/`:
  - 実行ログや生成物の履歴を保存します（初期は空）。
- `AI/scripts/`:
  - 自動化用のスクリプトを配置します。`youtube_gen.sh` が最初のエントリです。
- `lib/`:
  - 将来追加するユーティリティや共通モジュールの置き場（初期は空）。

## 前提条件
- macOS（他 OS でも Bash が動作すれば概ね可）
- `bash` 実行環境
- 必要に応じて API キー等の環境変数（使用する外部サービスに依存）

## セットアップ
1. リポジトリへ移動します。
   ```bash
   cd /Users/haruma/youtube_init
   ```
2. スクリプトの実行権限を付与します。
   ```bash
   chmod +x AI/scripts/youtube_gen.sh
   ```
3. （任意）外部サービスを使う場合は `.env` を作成し、必要な環境変数を定義します。
   ```bash
   # 例（使用サービスに合わせて編集）
   OPENAI_API_KEY=your_key
   ```
   - `.env` を使う場合は、スクリプト内で `source .env` を呼び出すなどの対応を行ってください。

## 使い方
- まず、AI ワークフローの指針を確認します。
  ```
  AI/instructions/copilot_agent_workflow.md
  ```
- 自動化スクリプトの実行（引数や詳細はスクリプト先頭のコメント/ヘルプを参照）：
  ```bash
  ./AI/scripts/youtube_gen.sh
  ```
- ヘルプ表示がある場合：
  ```bash
  ./AI/scripts/youtube_gen.sh --help
  ```
- スクリプトのオプションや前提は、`youtube_gen.sh` の内容を開いて確認してください。

## ログ保存（例）
- 実行ログを `AI/log/` に時刻付きで保存する例：
  ```bash
  ./AI/scripts/youtube_gen.sh 2>&1 | tee AI/log/$(date +%Y%m%d_%H%M%S).log
  ```

## カスタマイズ指針
- 新しい自動化や前処理/後処理は `AI/scripts/` に追加します。
- 共通処理や再利用可能なロジックは `lib/` に切り出します。
- 運用ノウハウやチェックリストは `AI/instructions/` に追記し、チーム共有しやすくします。

## トラブルシューティング
- 権限エラー: `chmod +x AI/scripts/youtube_gen.sh` を再確認。
- コマンドが見つからない: `bash` が利用可能か確認し、`cd /Users/haruma/youtube_init` の上で実行。
- 外部 API エラー: `.env` など環境変数の設定値を再確認。レート制限や認証設定も要確認。

## 今後の拡張アイデア
- 入力テンプレート/プロンプト管理を `AI/instructions/` に体系化。
- 生成物の保存規約（命名規則/メタ情報）を `AI/log/` で運用。
- テスト用のモックやスタブを `lib/` に整備。

---
この README は最小限のたたき台です。運用に合わせて追記・改良してください。