/* using { my.bookshop as my } from '../db/data-model.cds';
service AdminService @(requires:'admin') {
  entity Books as projection on my.Books;
  entity Authors as projection on my.Authors;
}

 */