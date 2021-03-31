package linksharing

import grails.validation.ValidationException
import org.springframework.web.multipart.MultipartFile

import static org.springframework.http.HttpStatus.*

class ResourceController {

    def createLink(){
        User user = session.getAttribute("user0") as User
        def t=params.get("urlTopic")
        Topic topic = Topic.findByName(t)
        Resource r=new LinkResource(description: params.get("urlDescription"),createdBy:user ,topic:Topic.findByName(t) ,url:params.get("url"))
        r.validate()

        if(r.hasErrors()){
            r.errors.allErrors.each {println it}
        }
        else{
            r.save(flush:true)
            topic.addToResources(r)
            topic.createdBy.addToResources(r)
        }

        redirect url: request.getHeader("Referer")
    }

    def fileUpload(){
        User user= session.getAttribute("user0") as User
        MultipartFile myFile = params.documentFile
        File file = new File("/home/ayush/Downloads/DocResource/${myFile.originalFilename}")
        myFile.transferTo(file)
        String path=file.getAbsolutePath()

        def t=params.get("documentTopic")
        Topic topic=Topic.findByName(t)
        Resource r=new DocumentResource(description: params.get("documentDescription"),
                createdBy:user ,topic:Topic.findByName(t) ,filePath: path)
        r.validate()
        if (r.hasErrors())
        {
            r.errors.allErrors.each {
                println it
            }
        }
        else
        {
            r.save(flush:true)
            topic.addToResources(r)
            topic.createdBy.addToResources(r)

        }

        redirect url: request.getHeader("Referer")
    }


    def downloadPost() {
        DocumentResource rs = Resource.findById(params.get("id") as long)
        File file = new File("${rs.filePath}")
        byte[] orderPDF = file.getBytes()
        response.setHeader("Content-disposition", "attachment; filename=" + file.name)
        response.contentLength = orderPDF.length
        response.outputStream << orderPDF
        redirect url: request.getHeader("Referer")
    }

}
