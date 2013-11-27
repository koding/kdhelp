#!/usr/bin/env node
// 
// # Psuedo Bin, Shebang Friendly
//
// This is the bin as defined by our package.json.
// We use JavaScript here because shebangs are.. interesting in Coffee. The
// real bin kode is found in `./kdhelp.js|coffee`.
// 
if (require.main === module) require('./kdhelp').main(process.argv)
