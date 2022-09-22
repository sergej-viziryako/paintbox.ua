{extends 'tpl.msEmail'}

{block 'title'}
  <b>You have a new order #[[+num]]</b>
  <p style="font-size: 13px;padding: 5px;margin: 0;">First Name, Last Name: [[+address.receiver]]</p>
  <p style="font-size: 13px;padding: 5px;margin: 0;">Phone: [[+address.phone]]</p>
  <p style="font-size: 13px;padding: 5px;margin: 0;">Email: [[+user.email]]</p>
  <p style="font-size: 13px;padding: 5px;margin: 0;">Address: [[+address.street]]</p>
  <p style="font-size: 13px;padding: 5px;margin: 0;">Apartment, suite, etc. (optional): [[+address.building]]</p>
  <p style="font-size: 13px;padding: 5px;margin: 0;">City: [[+address.city]]</p>
  <p style="font-size: 13px;padding: 5px;margin: 0;">Country/Region: [[+address.region]]</p>
  <p style="font-size: 13px;padding: 5px;margin: 0;">Postal code: [[+address.index]]</p>
  <p style="font-size: 13px;padding: 5px;margin: 0;">Payment: [[+payment.name]] </p>
  <p style="font-size: 13px;padding: 5px;margin: 0;">Shipping method: [[+delivery.name]] </p>
  <p style="font-size: 13px;padding: 5px;margin: 0;">comment: - [[+address.comment]]</p>
{/block}