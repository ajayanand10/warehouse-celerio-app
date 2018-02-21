//
// Project home: https://github.com/jaxio/celerio-angular-quickstart
// 
// Source code generated by Celerio, an Open Source code generator by Jaxio.
// Documentation: http://www.jaxio.com/documentation/celerio/
// Source code: https://github.com/jaxio/celerio/
// Follow us on twitter: @jaxiosoft
// This header can be customized in Celerio conf...
// Template pack-angular:web/src/app/entities/entity-detail.component.ts.e.vm
//
import {Component, OnInit, OnDestroy, Input, Output, EventEmitter} from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { SelectItem } from 'primeng/primeng';
import { MessageService} from '../../service/message.service';
import {Project} from './project';
import {ProjectService} from './project.service';
import {Author} from '../author/author';

@Component({
    moduleId: module.id,
	templateUrl: 'project-detail.component.html',
	selector: 'project-detail',
})
export class ProjectDetailComponent implements OnInit, OnDestroy {
    project : Project;

    private params_subscription: any;


    @Input() sub : boolean = false;
    @Input() // used to pass the parent when creating a new Project
    set author(author : Author) {
        this.project = new Project();
        this.project.author = author;
    }

    @Output() onSaveClicked = new EventEmitter<Project>();
    @Output() onCancelClicked = new EventEmitter();

    constructor(private route: ActivatedRoute, private router: Router, private messageService: MessageService, private projectService: ProjectService) {
    }

    ngOnInit() {
        if (this.sub) {
            return;
        }

        this.params_subscription = this.route.params.subscribe(params => {
            let id = params['id'];
            console.log('ngOnInit for project-detail ' + id);

            if (id === 'new') {
                this.project = new Project();
            } else {
                this.projectService.getProject(id)
                    .subscribe(project => {
                            this.project = project;
                        },
                        error =>  this.messageService.error('ngOnInit error', error)
                    );
            }
        });
    }

    ngOnDestroy() {
        if (!this.sub) {
            this.params_subscription.unsubscribe();
        }
    }

    gotoAuthor() {
        this.router.navigate(['/author', this.project.author.id]);
    }

    clearAuthor() {
        this.project.author = null;
    }

    onSave() {
        this.projectService.update(this.project).
            subscribe(
                project => {
                    this.project = project;
                    if (this.sub) {
                        this.onSaveClicked.emit(this.project);
                        this.messageService.info('Saved OK and msg emitted', 'Angular Rocks!')
                    } else {
                        this.messageService.info('Saved OK', 'Angular Rocks!')
                    }
                },
                error =>  this.messageService.error('Could not save', error)
            );
    }

    onCancel() {
        if (this.sub) {
            this.onCancelClicked.emit("cancel");
            this.messageService.info('Cancel clicked and msg emitted', 'Angular Rocks!')
        }
    }

}
