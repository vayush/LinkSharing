package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class TopPostService {

    def serviceMethod() {

    }

    List<Topic> toppost(){
        Map<Long,Integer> m=[:]
        Topic.list().each{
            m.put(it.id,it.resources.size())
        }
        m=m.sort{it.value}
        m
        List<Topic> l=[]
        Set<Integer> s= m.keySet()
        for(int i=0;i<s.size();i++)
        {
            l.add(Topic.findById(s[i]))
        }
        l=l.reverse()
        return l
    }

    def createreadingitems(Topic t,User u){
        t.resources.each {
            Resource re=Resource.findById(it.id)
            ReadingItem r = new ReadingItem(user: u, resource: re, isRead: false)
            r.save(flush: true)
            re.addToReadingItems(r)
            u.addToReadingItems(r)
        }
    }

    def deletereadingitems(Topic t,User u){
        t.resources.each{
            Resource re=Resource.get(it.id)
            ReadingItem r=ReadingItem.findByUserAndResource(u,re)
            u.removeFromReadingItems(r)
            re.removeFromReadingItems(r)
            r.delete(flush:true)
        }
    }
}
