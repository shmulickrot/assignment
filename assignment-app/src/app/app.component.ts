import {Component,ViewChild} from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';
import {HttpClient} from "@angular/common/http";
import {MatTableDataSource} from "@angular/material";

export interface ComponentItem {
  title: string;
  published_date: any;
  author: string;
  summary: string;
  content: string;
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})


export class AppComponent {
  title = 'assingment-app';
  data: any;
  url = "http://127.0.0.1:3000";

  constructor(private http: HttpClient) {
  }

  displayedColumns: string[] = ['title','published_date', 'author', 'summary', 'content'];
  dataSource = new MatTableDataSource(this.data)

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;

  ngOnInit() {
    console.log(this.url + "/content_items");
    this.http.get<ComponentItem>(this.url + "/content_items").subscribe((res) => {
      console.table(res);
      this.data = res;
    });
    this.dataSource.paginator = this.paginator;
  }

}
