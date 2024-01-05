using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LibraryMSMVC.Models;

namespace LibraryMSMVC.Controllers
{

    public class AdminTransactionController : Controller
    {
        LibraryMSWAEntities1 context = new LibraryMSWAEntities1();

        // Returns admin request view, here admin can accept and reject the book requests
        public ActionResult Requests()
        {
            return View(context.tblTransactions.ToList());
        }
        // Returns all book requests in json format.
        public ActionResult GetAllRequests()
        {
            var transactionList = context.tblTransactions.Where(r => r.TranStatus == "Requested").ToList();
            return Json(new { data = transactionList }, JsonRequestBehavior.AllowGet);
        }
        // Accepts the book request.
        public ActionResult AcceptRequest(int? tranId)
        {
           /* try
            {*/
                if (tranId == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                tblTransaction transaction = context.tblTransactions.FirstOrDefault(t => t.TranId == tranId);
                if (transaction == null)
                {
                    return HttpNotFound();
                }
                transaction.TranStatus = "Accepted";
                transaction.TranDate = DateTime.Now.ToShortDateString();
                context.SaveChanges();
                return View("Requests");
            /*}
            catch (Exception)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }*/

        }
        // Reject the book request. 
        public ActionResult RejectRequest(int? tranId)
        {
            /*try
            {*/
                if (tranId == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                tblTransaction transaction = context.tblTransactions.FirstOrDefault(t => t.TranId == tranId);
                if (transaction == null)
                {
                    return HttpNotFound();
                }
                transaction.TranStatus = "Rejected";
                transaction.TranDate = DateTime.Now.ToShortDateString();
                tblBook book = context.tblBooks.FirstOrDefault(b => b.BookId == transaction.BookId);
                book.BookCopies = book.BookCopies + 1;
                context.SaveChanges();
                context.SaveChanges();
                return View("Requests");
            /*}
            catch (Exception)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }*/
        }
        // Returns admin accepted view, here admin can view the accepted books.
        public ActionResult Accepted()
        {
            return View(context.tblTransactions.ToList());
        }
        // Returns all accepted books in json format.
        public ActionResult GetAllAccepted()
        {
            var transactionList = context.tblTransactions.Where(r => r.TranStatus == "Accepted").ToList();
            return Json(new { data = transactionList }, JsonRequestBehavior.AllowGet);
        }
        // Returns admin return view, here admin can accept book return requests.
        public ActionResult Return()
        {
            return View(context.tblTransactions.ToList());
        }
        // Returns all return books in json format.
        public ActionResult GetAllReturn()
        {
            var transactionList = context.tblTransactions.Where(r => r.TranStatus == "Returned").ToList();
            return Json(new { data = transactionList }, JsonRequestBehavior.AllowGet);
        }
        // Accepts the book return request.
        public ActionResult AcceptReturn(int? tranId)
        {

            /*try
            {*/
                if (tranId == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                tblTransaction transaction = context.tblTransactions.FirstOrDefault(t => t.TranId == tranId);
                if (transaction == null)
                {
                    return HttpNotFound();
                }
                tblBook book = context.tblBooks.FirstOrDefault(b => b.BookId == transaction.BookId);
                book.BookCopies = book.BookCopies + 1;
                context.SaveChanges();
                context.tblTransactions.Remove(transaction);
                context.SaveChanges();
                return View("Return");
            /*}
            catch (Exception)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }*/
        }
        // Returns admin home view.
        public ActionResult AdminHome()
        {
            return View();
        }
        // Returns admin about view.
        public ActionResult AdminAbout()
        {
            return View();
        }
        // Returns admin contact view.
        public ActionResult AdminContact()
        {
            return View();
        }
    }
}