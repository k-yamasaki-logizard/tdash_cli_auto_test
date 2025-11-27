/**
 * テストレポートの改行問題を解決するためのユーティリティ関数
 * 文字列内の改行コード（\n）をHTML改行タグ（<br>）に変換します
 */

/**
 * 文字列内の改行コード（\n）をHTML改行タグ（<br>）に変換する
 * @param {string} text - 処理する文字列
 * @return {string} 変換後の文字列
 */
function formatNewlines(text) {
    if (!text) return '';
    // 文字列内の改行コードをHTML改行タグに置換
    return text.replace(/\\n/g, '<br>');
}

// グローバルヘルパー関数として登録（JsRenderで使用可能にする）
$.views.helpers({
    formatNewlines: formatNewlines
});