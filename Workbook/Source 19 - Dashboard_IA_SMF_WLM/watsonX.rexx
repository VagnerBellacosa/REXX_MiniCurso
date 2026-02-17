/* REXX */
/* Mainframe + watsonx Integration */

parse arg prompt

if prompt = "" then do
   say "Uso: EXEC WATSONX 'Analyze WLM CPU trend'"
   exit 8
end

/* ==== CONFIGURAÇÃO ==== */
api_key = "SUA_API_KEY_AQUI"
endpoint = "https://us-south.ml.cloud.ibm.com/ml/v1/text/generation"

/* ==== Criar JSON temporário ==== */
json_file = "/tmp/watsonx_req.json"

json = '{' ||,
       '"model_id":"ibm/granite-13b-instruct-v2",' ||,
       '"input":"'prompt'",' ||,
       '"parameters":{"max_new_tokens":100}' ||,
       '}'

/* Grava JSON no USS */
address syscall
"write", json_file, json

/* ==== Chamada REST via curl ==== */
cmd = "curl -s -X POST "endpoint,
      "-H 'Authorization: Bearer "api_key"'" ,
      "-H 'Content-Type: application/json'" ,
      "-d @"json_file

address tso "BPXBATCH SH "cmd" > /tmp/watsonx_resp.json"

/* ==== Ler resposta ==== */
address tso "OCOPY INDD(PATH('/tmp/watsonx_resp.json')) OUTDD(RESP) TEXT"

address tso "ALLOC FI(RESP) DA('USER.WATSONX.RESP') NEW SPACE(5,5) TRACKS RECFM(VB) LRECL(255)"
address tso "EXECIO * DISKR RESP (STEM OUT. FINIS"

say "========================================="
say "         WATSONX RESPONSE               "
say "========================================="

do i = 1 to OUT.0
   say OUT.i
end

address tso "FREE FI(RESP)"

exit 0
