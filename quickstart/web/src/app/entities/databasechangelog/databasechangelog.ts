//
// Project home: https://github.com/jaxio/celerio-angular-quickstart
// 
// Source code generated by Celerio, an Open Source code generator by Jaxio.
// Documentation: http://www.jaxio.com/documentation/celerio/
// Source code: https://github.com/jaxio/celerio/
// Follow us on twitter: @jaxiosoft
// This header can be customized in Celerio conf...
// Template pack-angular:web/src/app/entities/entity.ts.e.vm
//

export class Databasechangelog {
    // Raw attributes
    id : string;
    author : string;
    filename : string;
    dateexecuted : Date;
    orderexecuted : number;
    exectype : string;
    md5sum : string;
    description : string;
    comments : string;
    tag : string;
    liquibase : string;
    contexts : string;
    labels : string;


    constructor(json? : any) {
        if (json != null) {
            this.id = json.id;
            this.author = json.author;
            this.filename = json.filename;
            if (json.dateexecuted != null) {
                this.dateexecuted = new Date(json.dateexecuted);
            }
            this.orderexecuted = json.orderexecuted;
            this.exectype = json.exectype;
            this.md5sum = json.md5sum;
            this.description = json.description;
            this.comments = json.comments;
            this.tag = json.tag;
            this.liquibase = json.liquibase;
            this.contexts = json.contexts;
            this.labels = json.labels;
        }
    }

    // Utils

    static toArray(jsons : any[]) : Databasechangelog[] {
        let databasechangelogs : Databasechangelog[] = [];
        if (jsons != null) {
            for (let json of jsons) {
                databasechangelogs.push(new Databasechangelog(json));
            }
        }
        return databasechangelogs;
    }
}
