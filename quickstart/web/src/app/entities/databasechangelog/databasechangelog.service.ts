//
// Project home: https://github.com/jaxio/celerio-angular-quickstart
// 
// Source code generated by Celerio, an Open Source code generator by Jaxio.
// Documentation: http://www.jaxio.com/documentation/celerio/
// Source code: https://github.com/jaxio/celerio/
// Follow us on twitter: @jaxiosoft
// This header can be customized in Celerio conf...
// Template pack-angular:web/src/app/entities/entity.service.ts.e.vm
//
import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse, HttpErrorResponse } from '@angular/common/http';
import { LazyLoadEvent } from 'primeng/primeng';
import { MessageService } from '../../service/message.service';
import { PageResponse, PageRequestByExample } from '../../support/paging';
import { Databasechangelog } from './databasechangelog';
import { Observable } from 'rxjs/Rx';
import { catchError, map } from 'rxjs/operators';
import 'rxjs/add/observable/throw';

@Injectable()
export class DatabasechangelogService {

    constructor(private http: HttpClient, private messageService : MessageService) {}

    /**
     * Get a Databasechangelog by id.
     */
    getDatabasechangelog(id : any) : Observable<Databasechangelog> {
        return this.http.get('/api/databasechangelogs/' + id)
            .pipe(
                map(response => new Databasechangelog(response)),
                catchError(this.handleError)
            );
    }

    /**
     * Update the passed databasechangelog.
     */
    update(databasechangelog : Databasechangelog) : Observable<Databasechangelog> {
        let body = databasechangelog;

        return this.http.put('/api/databasechangelogs/', body)
            .pipe(
                map(response => new Databasechangelog(response)),
                catchError(this.handleError)
            );
    }

    /**
     * Load a page (for paginated datatable) of Databasechangelog using the passed
     * databasechangelog as an example for the search by example facility.
     */
    getPage(databasechangelog : Databasechangelog, event : LazyLoadEvent) : Observable<PageResponse<Databasechangelog>> {
        let req = new PageRequestByExample(databasechangelog, event);
        let body = req;

        return this.http.post<PageResponse<any>>('/api/databasechangelogs/page', body)
            .pipe(
                map(pr =>  new PageResponse<Databasechangelog>(pr.totalPages, pr.totalElements, Databasechangelog.toArray(pr.content))),
                catchError(this.handleError)
            );
    }

    /**
     * Performs a search by example on 1 attribute (defined on server side) and returns at most 10 results.
     * Used by DatabasechangelogCompleteComponent.
     */
    complete(query : string) : Observable<Databasechangelog[]> {
        let body = {'query': query, 'maxResults': 10};
        return this.http.post<any[]>('/api/databasechangelogs/complete', body)
            .pipe(
                map(response => Databasechangelog.toArray(response)),
                catchError(this.handleError)
            );
    }

    /**
     * Delete an Databasechangelog by id.
     */
    delete(id : any) {
        return this.http.delete('/api/databasechangelogs/' + id)
            .pipe(catchError(this.handleError));
    }

    // sample method from angular doc
    private handleError (error: HttpErrorResponse) {
        // TODO: seems we cannot use messageService from here...
        let errMsg = (error.message) ? error.message : 'Server error';
        console.error(errMsg);
        if (error.status === 401 ) {
            window.location.href = '/';
        }
        return Observable.throw(errMsg);
    }
}
