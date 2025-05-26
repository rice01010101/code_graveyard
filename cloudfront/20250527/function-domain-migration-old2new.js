async function handler(event) {
    const request = event.request;

    // オブジェクト形式のクエリ文字列を配列として再構築する
    let qs=[];
    for (let key in request.querystring) {
        if (request.querystring[key].multiValue) {
            request.querystring[key].multiValue.forEach((mv) => {qs.push(key + "=" + mv.value)});
        } else {
            qs.push(key + "=" + request.querystring[key].value);
        }
    }
    // 配列を結合し単一の文字列として組み立てる
    let combinedQueryString = qs.join("&");
    // クエリ文字列が存在する場合は?を文字列の先頭に追加し再代入、存在しない場合は空値
    combinedQueryString = qs.length ? `?${combinedQueryString}` : "";

    // 移行先の新ドメインURL（HTTPS前提）
    const newurl = "https://YOUR_NEW_DOMAIN";
    // ドメイン変更に伴う永続的なリダイレクトのため301とし新しいドメインでURLを組み立て（クエリ文字列あれば加え）レスポンスする
    const response = {
        statusCode: 301,
        statusDescription: "Moved Permanently",
        headers: { "location": { "value": `${newurl}${request.uri}${combinedQueryString}` } }
    }

    return response;
}