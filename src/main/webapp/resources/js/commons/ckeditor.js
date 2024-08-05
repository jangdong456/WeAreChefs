//1. Adaptor
class UploadAdapter {
    constructor(loader) {
        this.loader = loader;
    }

    upload(){
        return this.loader.file.then(file => new Promise(((resolve, reject)=> {
            const files = new FormData();
            files.append("upload", file)//마음대로 파라미터이름 바꿔도됨
            fetch("./uploadContentImage", {  //마음대로 url바꿔도됨
                method:"POST",
                
                body: files
            })
            .then(r=>r.json())
            .then(r=>{
           		 console.log(r.url);
                resolve({
                    default:r.url
                })
            })
            .catch(e=>{
                return reject(e) //reject('File upload Fail')
            })
        }))
    )}

}


//2. Adpator plugin

function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new UploadAdapter(loader)
    }
}