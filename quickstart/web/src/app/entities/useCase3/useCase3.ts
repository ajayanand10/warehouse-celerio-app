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
import {UseCase3Pk} from "./useCase3Pk";
import {UseCase2} from '../useCase2/useCase2';

export class UseCase3 {
    id : UseCase3Pk = new UseCase3Pk();
    // Raw attributes
    dummy : string;
    // x-to-one
    id2 : UseCase2;


    constructor(json? : any) {
        if (json != null) {
            this.id = new UseCase3Pk(json.id);
            this.dummy = json.dummy;

            if (json.id2 != null) {
                this.id2 = new UseCase2(json.id2);
            }
        }
    }

    // Utils

    static toArray(jsons : any[]) : UseCase3[] {
        let useCase3s : UseCase3[] = [];
        if (jsons != null) {
            for (let json of jsons) {
                useCase3s.push(new UseCase3(json));
            }
        }
        return useCase3s;
    }
}
